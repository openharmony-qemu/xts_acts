/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "hello.impl.hpp"
#include "hello.proj.hpp"

#include <chrono>
#include <iostream>
#include <thread>

namespace {
using expected_void = ::taihe::expected<void, ::taihe::error>;
using expected_string = ::taihe::expected<::taihe::string, ::taihe::error>;
using expected_bool = ::taihe::expected<bool, ::taihe::error>;
using expected_i64 = ::taihe::expected<int64_t, ::taihe::error>;
using expected_complex = ::taihe::expected<::hello::ComplexAsyncResult, ::taihe::error>;
using expected_string_or_number = ::taihe::expected<::hello::StringOrNumber, ::taihe::error>;
using expected_string_array = ::taihe::expected<::taihe::array<::taihe::string>, ::taihe::error>;
using nested_string_future = ::taihe::future<expected_string>;
using expected_nested_string_future = ::taihe::expected<nested_string_future, ::taihe::error>;

constexpr int64_t DELAY_ASYNC_PROCESS = 100;
constexpr int64_t DELAY_DOUBLE_SECOND = 150;
constexpr int64_t DELAY_BASE_MANY = 50;
constexpr int64_t DELAY_STEP_MANY = 25;
constexpr int64_t DELAY_STRING_OR_NUM = 80;
constexpr int64_t DELAY_CONTAINER = 60;
constexpr int64_t DELAY_NESTED_OUTER = 40;
constexpr int64_t DELAY_NESTED_INNER = 100;
constexpr int64_t DOUBLE_MULTIPLIER = 2;

::taihe::expected<void, ::taihe::error> FutureResultWithCallback(int64_t ms, ::taihe::string_view val,
                                                                 ::taihe::completer<expected_string> completer)
{
    if (ms < 0) {
        return taihe::unexpected<taihe::error>("ms cannot be negative");
    }
    std::thread([ms, val = taihe::string(val), completer = std::move(completer)]() mutable {
        std::cout << "[Future Result] Waiting for " << ms << " milliseconds..." << std::endl;
        std::this_thread::sleep_for(std::chrono::milliseconds(ms));
        std::cout << "[Future Result] Task completed, completing future..." << std::endl;
        if (val.empty()) {
            completer.complete(taihe::unexpected<taihe::error>("val cannot be empty"));
        } else {
            completer.complete("C++AsyncProcessed-" + val);
        }
    }).detach();
    return {};
}

::taihe::expected<::taihe::future<expected_string>, ::taihe::error> FutureResultReturnsPromise(int64_t ms,
                                                                                               ::taihe::string_view val)
{
    auto [completer, future] = taihe::make_async_pair<expected_string>();
    if (ms < 0) {
        return taihe::unexpected<taihe::error>("ms cannot be negative");
    }
    std::thread([ms, val = taihe::string(val), completer = std::move(completer)]() mutable {
        std::this_thread::sleep_for(std::chrono::milliseconds(ms));
        if (val.empty()) {
            completer.complete(taihe::unexpected<taihe::error>("val cannot be empty"));
        } else {
            completer.complete("C++AsyncProcessed-" + val);
        }
    }).detach();
    return std::move(future);
}

::taihe::expected<void, ::taihe::error> ProcessUserTypeWithCallback(::hello::weak::UserType user, int64_t etsMs,
                                                                    int64_t cppMs, ::taihe::string_view result,
                                                                    ::taihe::completer<expected_string> fin)
{
    if (etsMs < 0 || cppMs < 0) {
        return taihe::unexpected<taihe::error>("ms cannot be negative");
    }

    auto [mid, tmp] = taihe::make_async_pair<expected_string>();

    auto exp = user->fooWithCallback(etsMs, "C++SyncProcessed-" + result, std::move(mid));
    if (not exp) {
        fin.complete(taihe::unexpected<taihe::error>(exp.error()));
    } else {
        tmp.on_complete([fin = std::move(fin), cppMs](expected_string &&res) mutable {
            if (res) {
                std::this_thread::sleep_for(std::chrono::milliseconds(cppMs));
                fin.complete("C++AsyncProcessed-" + res.value());
            } else {
                fin.complete(taihe::unexpected<taihe::error>(res.error()));
            }
        });
    }

    return {};
}

::taihe::expected<::taihe::future<expected_string>, ::taihe::error> ProcessUserTypeReturnsPromise(
    ::hello::weak::UserType user, int64_t etsMs, int64_t cppMs, ::taihe::string_view result)
{
    if (etsMs < 0 || cppMs < 0) {
        return taihe::unexpected<taihe::error>("ms cannot be negative");
    }

    auto exp = user->fooReturnsPromise(etsMs, "C++SyncProcessed-" + result);

    auto [fin, fut] = taihe::make_async_pair<expected_string>();

    if (not exp) {
        fin.complete(taihe::unexpected<taihe::error>(exp.error()));
    } else {
        exp.value().on_complete([fin = std::move(fin), cppMs](expected_string &&res) mutable {
            if (res) {
                std::this_thread::sleep_for(std::chrono::milliseconds(cppMs));
                fin.complete("C++AsyncProcessed-" + res.value());
            } else {
                fin.complete(taihe::unexpected<taihe::error>(res.error()));
            }
        });
    }

    return std::move(fut);
}

::taihe::expected<void, ::taihe::error> TestVoidAsyncWithCallback(int64_t ms, ::taihe::completer<expected_void> set)
{
    if (ms < 0) {
        return taihe::unexpected<taihe::error>("ms cannot be negative");
    }
    std::thread([ms, set = std::move(set)]() mutable {
        std::this_thread::sleep_for(std::chrono::milliseconds(ms));
        set.complete();
    }).detach();
    return {};
}

::taihe::expected<::taihe::future<expected_void>, ::taihe::error> TestVoidAsyncReturnsPromise(int64_t ms)
{
    if (ms < 0) {
        return taihe::unexpected<taihe::error>("ms cannot be negative");
    }
    auto [set, fut] = taihe::make_async_pair<expected_void>();

    std::thread([ms, set = std::move(set)]() mutable {
        std::this_thread::sleep_for(std::chrono::milliseconds(ms));
        set.complete();
    }).detach();

    return std::move(fut);
}

::taihe::expected<void, ::taihe::error> TestReverseVoidAsyncWithCallback(::hello::weak::VoidAsyncUserType user,
                                                                         ::taihe::completer<expected_void> set)
{
    auto [mid, tmp] = taihe::make_async_pair<expected_void>();

    auto exp = user->barWithCallback(std::move(mid));
    if (not exp) {
        set.complete(taihe::unexpected<taihe::error>(exp.error()));
    } else {
        tmp.on_complete([set = std::move(set)](expected_void &&res) mutable {
            if (res) {
                set.complete();
            } else {
                set.complete(taihe::unexpected<taihe::error>(res.error()));
            }
        });
    }

    return {};
}

::taihe::expected<::taihe::future<expected_void>, ::taihe::error> TestReverseVoidAsyncReturnsPromise(
    ::hello::weak::VoidAsyncUserType user)
{
    auto exp = user->barReturnsPromise();

    auto [set, fut] = taihe::make_async_pair<expected_void>();

    if (not exp) {
        set.complete(taihe::unexpected<taihe::error>(exp.error()));
    } else {
        exp.value().on_complete([set = std::move(set)](expected_void &&res) mutable {
            if (res) {
                set.complete();
            } else {
                set.complete(taihe::unexpected<taihe::error>(res.error()));
            }
        });
    }

    return std::move(fut);
}

::taihe::expected<::taihe::future<expected_string>, ::taihe::error> TestSyncOrAsync(
    ::hello::weak::SyncOrAsyncUserType user)
{
    auto exp = user->baz();
    if (not exp) {
        return taihe::unexpected<taihe::error>(exp.error());
    }

    ::hello::syncOrAsyncBool result = std::move(exp.value());
    if (result.holds_syncBool()) {
        return ::taihe::make_ready_future<expected_string>(result.get_syncBool_ref() ? "C++SyncBool-true"
                                                                                     : "C++SyncBool-false");
    }

    auto [set, fut] = taihe::make_async_pair<expected_string>();
    std::move(result).get_asyncBool_ref().on_complete([set = std::move(set)](expected_bool &&res) mutable {
        if (res) {
            set.complete(res.value() ? "C++AsyncBool-true" : "C++AsyncBool-false");
        } else {
            set.complete(taihe::unexpected<taihe::error>(res.error()));
        }
    });
    return std::move(fut);
}

::taihe::expected<::hello::DoubleAsyncResults, ::taihe::error> GetDoubleAsyncResults(::taihe::string_view firstResult,
                                                                                     int64_t secondResult)
{
    auto [firstSet, firstFuture] = taihe::make_async_pair<expected_string>();
    auto [secondSet, secondFuture] = taihe::make_async_pair<expected_i64>();

    std::thread([firstSet = std::move(firstSet), firstResult = ::taihe::string(firstResult)]() mutable {
        std::this_thread::sleep_for(std::chrono::milliseconds(DELAY_ASYNC_PROCESS));
        firstSet.complete("C++AsyncProcessed-" + firstResult);
    }).detach();

    std::thread([secondSet = std::move(secondSet), secondResult]() mutable {
        std::this_thread::sleep_for(std::chrono::milliseconds(DELAY_DOUBLE_SECOND));
        secondSet.complete(secondResult * DOUBLE_MULTIPLIER);
    }).detach();

    return ::hello::DoubleAsyncResults {
        std::move(firstFuture),
        std::move(secondFuture),
    };
}

::taihe::expected<::taihe::array<::taihe::future<expected_string>>, ::taihe::error> GetManyAsyncResults(
    int64_t count, ::taihe::string_view result)
{
    if (count < 0) {
        return taihe::unexpected<taihe::error>("count cannot be negative");
    }

    std::vector<::taihe::future<expected_string>> futures;
    futures.reserve(static_cast<size_t>(count));

    for (int64_t index = 0; index < count; ++index) {
        auto [set, fut] = taihe::make_async_pair<expected_string>();
        futures.emplace_back(std::move(fut));

        std::thread([set = std::move(set), result = ::taihe::string(result), index]() mutable {
            std::this_thread::sleep_for(std::chrono::milliseconds(DELAY_BASE_MANY + index * DELAY_STEP_MANY));
            set.complete("C++AsyncProcessed-" + result + "-" + std::to_string(index));
        }).detach();
    }

    return ::taihe::array<::taihe::future<expected_string>>(::taihe::move_data, futures.begin(), futures.size());
}

::taihe::expected<::taihe::future<expected_complex>, ::taihe::error> GetComplexAsyncResult(::taihe::string_view str,
                                                                                           int64_t num, bool flag)
{
    auto [set, fut] = taihe::make_async_pair<expected_complex>();

    std::thread([set = std::move(set), str = ::taihe::string(str), num, flag]() mutable {
        std::this_thread::sleep_for(std::chrono::milliseconds(DELAY_ASYNC_PROCESS));
        set.complete(::hello::ComplexAsyncResult {str, num, flag});
    }).detach();

    return std::move(fut);
}

::taihe::expected<::taihe::future<expected_string_or_number>, ::taihe::error> GetStringOrNumber(
    bool asString, ::taihe::string_view str, int64_t num)
{
    auto [set, fut] = taihe::make_async_pair<expected_string_or_number>();

    std::thread([set = std::move(set), asString, str = ::taihe::string(str), num]() mutable {
        std::this_thread::sleep_for(std::chrono::milliseconds(DELAY_STRING_OR_NUM));
        if (asString) {
            set.complete(::hello::StringOrNumber::make_str(str));
        } else {
            set.complete(::hello::StringOrNumber::make_num(num));
        }
    }).detach();

    return std::move(fut);
}

::taihe::expected<::taihe::future<expected_string_array>, ::taihe::error> GetContainer()
{
    auto [set, fut] = taihe::make_async_pair<expected_string_array>();

    std::thread([set = std::move(set)]() mutable {
        std::this_thread::sleep_for(std::chrono::milliseconds(DELAY_CONTAINER));
        set.complete(::taihe::array<::taihe::string> {"alpha", "beta", "gamma"});
    }).detach();

    return std::move(fut);
}

::taihe::expected<::taihe::future<expected_nested_string_future>, ::taihe::error> GetNestedFuture()
{
    auto [outerSet, outerFuture] = taihe::make_async_pair<expected_nested_string_future>();
    auto [innerSet, innerFuture] = taihe::make_async_pair<expected_string>();

    std::thread([outerSet = std::move(outerSet), innerFuture = std::move(innerFuture)]() mutable {
        std::this_thread::sleep_for(std::chrono::milliseconds(DELAY_NESTED_OUTER));
        outerSet.complete(std::move(innerFuture));
    }).detach();

    std::thread([innerSet = std::move(innerSet)]() mutable {
        std::this_thread::sleep_for(std::chrono::milliseconds(DELAY_NESTED_INNER));
        innerSet.complete("C++NestedFuture");
    }).detach();

    return std::move(outerFuture);
}
}  // namespace

// NOLINTBEGIN
TH_EXPORT_CPP_API_futureResultWithCallback(FutureResultWithCallback);
TH_EXPORT_CPP_API_futureResultReturnsPromise(FutureResultReturnsPromise);
TH_EXPORT_CPP_API_processUserTypeWithCallback(ProcessUserTypeWithCallback);
TH_EXPORT_CPP_API_processUserTypeReturnsPromise(ProcessUserTypeReturnsPromise);
TH_EXPORT_CPP_API_testVoidAsyncWithCallback(TestVoidAsyncWithCallback);
TH_EXPORT_CPP_API_testVoidAsyncReturnsPromise(TestVoidAsyncReturnsPromise);
TH_EXPORT_CPP_API_testReverseVoidAsyncWithCallback(TestReverseVoidAsyncWithCallback);
TH_EXPORT_CPP_API_testReverseVoidAsyncReturnsPromise(TestReverseVoidAsyncReturnsPromise);
TH_EXPORT_CPP_API_testSyncOrAsync(TestSyncOrAsync);
TH_EXPORT_CPP_API_getDoubleAsyncResults(GetDoubleAsyncResults);
TH_EXPORT_CPP_API_getManyAsyncResults(GetManyAsyncResults);
TH_EXPORT_CPP_API_getComplexAsyncResult(GetComplexAsyncResult);
TH_EXPORT_CPP_API_getStringOrNumber(GetStringOrNumber);
TH_EXPORT_CPP_API_getContainer(GetContainer);
TH_EXPORT_CPP_API_getNestedFuture(GetNestedFuture);
// NOLINTEND