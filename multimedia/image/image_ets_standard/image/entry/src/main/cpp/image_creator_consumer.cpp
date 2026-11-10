/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cstring>
#include <elf.h>
#include <link.h>
#include <memory>
#include <thread>
#include <unistd.h>

#include "napi/native_api.h"

#define HASH_CAL_VALUE 33
#define DEFAULT_SYSTEM_BIT 8

namespace OHOS {
enum GSError : int32_t {
    GSERROR_OK = 0,
};

struct Rect {
    int32_t x;
    int32_t y;
    int32_t w;
    int32_t h;
};

class ConsumerSurface;

struct RawSptr {
    void *ptr = nullptr;
    RawSptr() = default;
    ~RawSptr() {}
};
} // namespace OHOS

namespace OHOS::Media {
class ImageCreator;
class ImageCreatorNapi;
} // namespace OHOS::Media

namespace {
constexpr size_t EXPECTED_ARG_COUNT = 1;

constexpr const char *GET_NATIVE_CREATOR_SYMBOL =
    "_ZN4OHOS5Media16ImageCreatorNapi21GetNativeImageCreatorEv";
constexpr const char *GET_CREATOR_SURFACE_SYMBOL =
    "_ZN4OHOS5Media12ImageCreator17GetCreatorSurfaceEv";
constexpr const char *ON_BUFFER_RELEASE_SYMBOL =
    "_ZN4OHOS5Media12ImageCreator15OnBufferReleaseERNS_4sptrINS_13SurfaceBufferEEE";
constexpr const char *ACQUIRE_BUFFER_SYMBOL_64 =
    "_ZN4OHOS15ConsumerSurface13AcquireBufferERNS_4sptrINS_13SurfaceBufferEEERiRlRNS_4RectE";
constexpr const char *ACQUIRE_BUFFER_SYMBOL_32 =
    "_ZN4OHOS15ConsumerSurface13AcquireBufferERNS_4sptrINS_13SurfaceBufferEEERiRxRNS_4RectE";
constexpr const char *RELEASE_BUFFER_SYMBOL =
    "_ZN4OHOS15ConsumerSurface13ReleaseBufferERNS_4sptrINS_13SurfaceBufferEEEi";
constexpr const char *DEC_STRONG_REF_SYMBOL = "_ZN4OHOS7RefBase12DecStrongRefEPKv";

using GetNativeCreator = std::shared_ptr<OHOS::Media::ImageCreator> (*)(OHOS::Media::ImageCreatorNapi *);
using GetCreatorSurface = OHOS::RawSptr (*)(OHOS::Media::ImageCreator *);
using OnBufferRelease = OHOS::GSError (*)(OHOS::RawSptr &);
using AcquireBuffer = OHOS::GSError (*)(OHOS::ConsumerSurface *, OHOS::RawSptr &, int32_t &, int64_t &,
    OHOS::Rect &);
using ReleaseBuffer = OHOS::GSError (*)(OHOS::ConsumerSurface *, OHOS::RawSptr &, int32_t);
using DecStrongRef = void (*)(void *, const void *);

uint32_t GnuHash(const char *name)
{
    uint32_t hash = 5381;
    for (const auto *cursor = reinterpret_cast<const uint8_t *>(name); *cursor != 0; ++cursor) {
        hash = hash * HASH_CAL_VALUE + *cursor;
    }
    return hash;
}

bool Is64BitSystem()
{
#if defined(__aarch64__) || defined(__x86_64__) || defined(_LP64) || defined(__LP64__)
    return true;
#elif defined(__arm__) || defined(__i386__) || defined(_ILP32) || defined(__ILP32__)
    return false;
#else
    return sizeof(void *) == DEFAULT_SYSTEM_BIT;
#endif
}

struct SymbolQuery {
    const char *library;
    const char *symbol;
    void *address = nullptr;
};

int FindLoadedSymbol64(dl_phdr_info *info, SymbolQuery *query)
{
    const Elf64_Dyn *dynamic = nullptr;
    for (Elf64_Half index = 0; index < info->dlpi_phnum; ++index) {
        if (info->dlpi_phdr[index].p_type == PT_DYNAMIC) {
            dynamic = reinterpret_cast<const Elf64_Dyn *>(info->dlpi_addr + info->dlpi_phdr[index].p_vaddr);
            break;
        }
    }
    if (dynamic == nullptr) {
        return 0;
    }

    const Elf64_Sym *symbols = nullptr;
    const char *strings = nullptr;
    const uint32_t *gnuHash = nullptr;
    for (const Elf64_Dyn *entry = dynamic; entry->d_tag != DT_NULL; ++entry) {
        if (entry->d_tag == DT_SYMTAB) {
            symbols = reinterpret_cast<const Elf64_Sym *>(info->dlpi_addr + entry->d_un.d_ptr);
        } else if (entry->d_tag == DT_STRTAB) {
            strings = reinterpret_cast<const char *>(info->dlpi_addr + entry->d_un.d_ptr);
        } else if (entry->d_tag == DT_GNU_HASH) {
            gnuHash = reinterpret_cast<const uint32_t *>(info->dlpi_addr + entry->d_un.d_ptr);
        }
    }
    if (symbols == nullptr || strings == nullptr || gnuHash == nullptr) {
        return 0;
    }

    const uint32_t bucketCount = gnuHash[0];
    const uint32_t symbolOffset = gnuHash[1];
    const uint32_t bloomSize = gnuHash[2];
    const uint32_t bloomShift = gnuHash[3];
    const auto *bloom = reinterpret_cast<const Elf64_Xword *>(gnuHash + 4);
    const auto *buckets = reinterpret_cast<const uint32_t *>(bloom + bloomSize);
    const auto *chains = buckets + bucketCount;
    const uint32_t hash = GnuHash(query->symbol);
    constexpr uint32_t BLOOM_WORD_BITS = sizeof(Elf64_Xword) * 8;
    const Elf64_Xword bloomWord = bloom[(hash / BLOOM_WORD_BITS) % bloomSize];
    const Elf64_Xword mask = (static_cast<Elf64_Xword>(1) << (hash % BLOOM_WORD_BITS)) |
        (static_cast<Elf64_Xword>(1) << ((hash >> bloomShift) % BLOOM_WORD_BITS));
    if ((bloomWord & mask) != mask) {
        return 0;
    }

    uint32_t symbolIndex = buckets[hash % bucketCount];
    if (symbolIndex < symbolOffset) {
        return 0;
    }
    while (true) {
        const uint32_t chainHash = chains[symbolIndex - symbolOffset];
        if ((chainHash | 1U) == (hash | 1U) && std::strcmp(strings + symbols[symbolIndex].st_name,
            query->symbol) == 0) {
            query->address = reinterpret_cast<void *>(info->dlpi_addr + symbols[symbolIndex].st_value);
            return 1;
        }
        if ((chainHash & 1U) != 0) {
            return 0;
        }
        ++symbolIndex;
    }
}

int FindLoadedSymbol32(dl_phdr_info *info, SymbolQuery *query)
{
    const Elf32_Dyn *dynamic = nullptr;
    for (Elf32_Half index = 0; index < info->dlpi_phnum; ++index) {
        if (info->dlpi_phdr[index].p_type == PT_DYNAMIC) {
            dynamic = reinterpret_cast<const Elf32_Dyn *>(info->dlpi_addr + info->dlpi_phdr[index].p_vaddr);
            break;
        }
    }
    if (dynamic == nullptr) {
        return 0;
    }

    const Elf32_Sym *symbols = nullptr;
    const char *strings = nullptr;
    const uint32_t *gnuHash = nullptr;
    for (const Elf32_Dyn *entry = dynamic; entry->d_tag != DT_NULL; ++entry) {
        if (entry->d_tag == DT_SYMTAB) {
            symbols = reinterpret_cast<const Elf32_Sym *>(info->dlpi_addr + entry->d_un.d_ptr);
        } else if (entry->d_tag == DT_STRTAB) {
            strings = reinterpret_cast<const char *>(info->dlpi_addr + entry->d_un.d_ptr);
        } else if (entry->d_tag == DT_GNU_HASH) {
            gnuHash = reinterpret_cast<const uint32_t *>(info->dlpi_addr + entry->d_un.d_ptr);
        }
    }
    if (symbols == nullptr || strings == nullptr || gnuHash == nullptr) {
        return 0;
    }

    const uint32_t bucketCount = gnuHash[0];
    const uint32_t symbolOffset = gnuHash[1];
    const uint32_t bloomSize = gnuHash[2];
    const uint32_t bloomShift = gnuHash[3];
    const auto *bloom = reinterpret_cast<const Elf32_Word *>(gnuHash + 4);
    const auto *buckets = reinterpret_cast<const uint32_t *>(bloom + bloomSize);
    const auto *chains = buckets + bucketCount;
    const uint32_t hash = GnuHash(query->symbol);
    constexpr uint32_t BLOOM_WORD_BITS = sizeof(Elf32_Word) * 8;
    const Elf32_Word bloomWord = bloom[(hash / BLOOM_WORD_BITS) % bloomSize];
    const Elf32_Word mask = (static_cast<Elf32_Word>(1) << (hash % BLOOM_WORD_BITS)) |
        (static_cast<Elf32_Word>(1) << ((hash >> bloomShift) % BLOOM_WORD_BITS));
    if ((bloomWord & mask) != mask) {
        return 0;
    }

    uint32_t symbolIndex = buckets[hash % bucketCount];
    if (symbolIndex < symbolOffset) {
        return 0;
    }
    while (true) {
        const uint32_t chainHash = chains[symbolIndex - symbolOffset];
        if ((chainHash | 1U) == (hash | 1U) && std::strcmp(strings + symbols[symbolIndex].st_name,
            query->symbol) == 0) {
            query->address = reinterpret_cast<void *>(info->dlpi_addr + symbols[symbolIndex].st_value);
            return 1;
        }
        if ((chainHash & 1U) != 0) {
            return 0;
        }
        ++symbolIndex;
    }
}

int FindLoadedSymbol(dl_phdr_info *info, size_t, void *data)
{
    auto *query = static_cast<SymbolQuery *>(data);
    if (info->dlpi_name == nullptr || std::strstr(info->dlpi_name, query->library) == nullptr) {
        return 0;
    }

    if (Is64BitSystem()) {
        return FindLoadedSymbol64(info, query);
    } else {
        return FindLoadedSymbol32(info, query);
    }
}

template<typename Function>
Function Resolve(const char *library, const char *symbol)
{
    SymbolQuery query = { library, symbol, nullptr };
    dl_iterate_phdr(FindLoadedSymbol, &query);
    return reinterpret_cast<Function>(query.address);
}

napi_value ThrowError(napi_env env, const char *message)
{
    napi_throw_error(env, nullptr, message);
    return nullptr;
}

void SetInt32(napi_env env, napi_value object, const char *name, int32_t value)
{
    napi_value jsValue = nullptr;
    napi_create_int32(env, value, &jsValue);
    napi_set_named_property(env, object, name, jsValue);
}

void SetInt64(napi_env env, napi_value object, const char *name, int64_t value)
{
    napi_value jsValue = nullptr;
    napi_create_int64(env, value, &jsValue);
    napi_set_named_property(env, object, name, jsValue);
}

napi_value ConsumeOnce(napi_env env, napi_callback_info info)
{
    size_t argc = EXPECTED_ARG_COUNT;
    napi_value argv[EXPECTED_ARG_COUNT] = { nullptr };
    napi_status status = napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    if (status != napi_ok || argc != EXPECTED_ARG_COUNT) {
        return ThrowError(env, "consumeOnce requires one ImageCreator argument");
    }

    void *wrappedCreator = nullptr;
    status = napi_unwrap(env, argv[0], &wrappedCreator);
    if (status != napi_ok || wrappedCreator == nullptr) {
        return ThrowError(env, "failed to unwrap ImageCreator");
    }

    const GetNativeCreator getNativeCreator =
        Resolve<GetNativeCreator>("libimage_napi.z.so", GET_NATIVE_CREATOR_SYMBOL);
    const GetCreatorSurface getCreatorSurface =
        Resolve<GetCreatorSurface>("libimage_native.z.so", GET_CREATOR_SURFACE_SYMBOL);
    const OnBufferRelease onBufferRelease =
        Resolve<OnBufferRelease>("libimage_native.z.so", ON_BUFFER_RELEASE_SYMBOL);
    const char *acquireBufferSymbol = Is64BitSystem() ? ACQUIRE_BUFFER_SYMBOL_64 : ACQUIRE_BUFFER_SYMBOL_32;
    const AcquireBuffer acquireBuffer = Resolve<AcquireBuffer>("libsurface.z.so", acquireBufferSymbol);
    const ReleaseBuffer releaseBuffer = Resolve<ReleaseBuffer>("libsurface.z.so", RELEASE_BUFFER_SYMBOL);
    const DecStrongRef decStrongRef = Resolve<DecStrongRef>("libutils.z.so", DEC_STRONG_REF_SYMBOL);
    if (getNativeCreator == nullptr) {
        return ThrowError(env, "GetNativeImageCreator symbol is unavailable");
    }
    if (getCreatorSurface == nullptr) {
        return ThrowError(env, "GetCreatorSurface symbol is unavailable");
    }
    if (onBufferRelease == nullptr) {
        return ThrowError(env, "OnBufferRelease symbol is unavailable");
    }
    if (acquireBuffer == nullptr) {
        return ThrowError(env, "AcquireBuffer symbol is unavailable");
    }
    if (releaseBuffer == nullptr) {
        return ThrowError(env, "ReleaseBuffer symbol is unavailable");
    }
    if (decStrongRef == nullptr) {
        return ThrowError(env, "DecStrongRef symbol is unavailable");
    }

    auto *creatorNapi = static_cast<OHOS::Media::ImageCreatorNapi *>(wrappedCreator);
    std::shared_ptr<OHOS::Media::ImageCreator> creator = getNativeCreator(creatorNapi);
    if (creator == nullptr) {
        return ThrowError(env, "native ImageCreator is null");
    }

    OHOS::RawSptr surface = getCreatorSurface(creator.get());
    if (surface.ptr == nullptr) {
        return ThrowError(env, "ImageCreator consumer surface is null");
    }

    OHOS::RawSptr buffer;
    int32_t fence = -1;
    int64_t timestamp = 0;
    OHOS::Rect damage = {};
    auto *consumerSurface = static_cast<OHOS::ConsumerSurface *>(surface.ptr);
    const OHOS::GSError acquireResult = acquireBuffer(consumerSurface, buffer, fence, timestamp, damage);
    if (acquireResult != OHOS::GSERROR_OK || buffer.ptr == nullptr) {
        if (fence >= 0) {
            close(fence);
        }
        if (buffer.ptr != nullptr) {
            decStrongRef(buffer.ptr, &buffer);
        }
        decStrongRef(surface.ptr, &surface);
        return ThrowError(env, "failed to acquire queued ImageCreator buffer");
    }

    // A production consumer normally releases the buffer from an independent
    // pipeline. Drive the registered producer callback from a worker thread to
    // reproduce that delivery model in this same-process device test.
    std::thread releaseCallbackThread([&]() {
        (void)onBufferRelease(buffer);
    });
    releaseCallbackThread.join();
    const OHOS::GSError releaseResult = releaseBuffer(consumerSurface, buffer, -1);
    if (fence >= 0) {
        close(fence);
    }
    decStrongRef(buffer.ptr, &buffer);
    decStrongRef(surface.ptr, &surface);

    napi_value result = nullptr;
    napi_create_object(env, &result);
    SetInt32(env, result, "acquireResult", static_cast<int32_t>(acquireResult));
    SetInt32(env, result, "releaseResult", static_cast<int32_t>(releaseResult));
    SetInt64(env, result, "timestamp", timestamp);
    return result;
}
} // namespace

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor descriptor = {
        "consumeOnce", nullptr, ConsumeOnce, nullptr, nullptr, nullptr, napi_default, nullptr
    };
    napi_define_properties(env, exports, 1, &descriptor);
    return exports;
}
EXTERN_C_END

static napi_module module = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = nullptr,
    .reserved = { nullptr },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule()
{
    napi_module_register(&module);
}
