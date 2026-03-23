/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include "include/VideodecNdkSampleTest.h"
#include "include/VideodecApi11SampleTest.h"

#include <iostream>
#include <sys/time.h>
#include <utility>

using namespace OHOS;
using namespace OHOS::Media;
using namespace std;

namespace {
constexpr int64_t NANOS_IN_SECOND = 1000000000L;
constexpr int64_t NANOS_IN_MICRO = 1000L;

constexpr int32_t EIGHT = 8;
constexpr int32_t SIXTEEN = 16;
constexpr int32_t TWENTY_FOUR = 24;
constexpr uint8_t SEI = 6;
constexpr uint8_t SPS = 7;
constexpr uint8_t PPS = 8;
constexpr uint32_t START_CODE_SIZE = 4;
constexpr uint8_t START_CODE[START_CODE_SIZE] = { 0, 0, 0, 1 };
constexpr uint32_t FRAME_INTERVAL = 16666;
constexpr uint32_t EOS_COUNT = 10;
constexpr uint32_t MAX_WIDTH = 4000;
constexpr uint32_t MAX_HEIGHT = 3000;
VDecNdkSample* dec_sample = nullptr;
constexpr uint8_t H264_NALU_TYPE = 0x1f;

void clearIntqueue(std::queue<uint32_t>& q)
{
    std::queue<uint32_t> empty;
    swap(empty, q);
}

void clearBufferqueue(std::queue<OH_AVCodecBufferAttr>& q)
{
    std::queue<OH_AVCodecBufferAttr> empty;
    swap(empty, q);
}
} // namespace

VDecNdkSample::~VDecNdkSample()
{
    Release();
}

void VdecError(OH_AVCodec* codec, int32_t errorCode, void* userData)
{
    VDecSignal* signal = static_cast<VDecSignal*>(userData);
    if (signal == nullptr) {
        return;
    }
    cout << "Error errorCode=" << errorCode << endl;
    signal->inCond_.notify_all();
}

void VdecFormatChanged(OH_AVCodec* codec, OH_AVFormat* format, void* userData)
{
    (void)codec;
    (void)userData;
    cout << "Format Changed" << endl;
    if (dec_sample == nullptr) {
        return;
    }
    int32_t current_width = 0;
    int32_t current_height = 0;
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_WIDTH, &current_width);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_HEIGHT, &current_height);
    dec_sample->DEFAULT_WIDTH = static_cast<uint32_t>(current_width);
    dec_sample->DEFAULT_HEIGHT = static_cast<uint32_t>(current_height);
}

void VdecInputDataReady(OH_AVCodec* codec, uint32_t index, OH_AVMemory* data, void* userData)
{
    (void)codec;
    VDecSignal* signal = static_cast<VDecSignal*>(userData);
    if (signal == nullptr) {
        return;
    }
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inIdxQueue_.push(index);
    signal->inBufferQueue_.push(data);
    signal->inCond_.notify_all();
}

void VdecOutputDataReady(OH_AVCodec* codec,
                         uint32_t index,
                         OH_AVMemory* data,
                         OH_AVCodecBufferAttr* attr,
                         void* userData)
{
    (void)codec;
    VDecSignal* signal = static_cast<VDecSignal*>(userData);
    if (signal == nullptr) {
        return;
    }
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outIdxQueue_.push(index);
    signal->attrQueue_.push(*attr);
    signal->outBufferQueue_.push(data);
    signal->outCond_.notify_all();
}

bool VDecNdkSample::MdCompare(unsigned char* buffer, int len, const char* source[])
{
    (void)buffer;
    (void)len;
    (void)source;
    return true;
}

int64_t VDecNdkSample::GetSystemTimeUs()
{
    struct timespec now;
    (void)clock_gettime(CLOCK_BOOTTIME, &now);
    int64_t nanoTime = static_cast<int64_t>(now.tv_sec) * NANOS_IN_SECOND + now.tv_nsec;
    return nanoTime / NANOS_IN_MICRO;
}

int32_t VDecNdkSample::ConfigureVideoDecoder()
{
    OH_AVFormat* format = OH_AVFormat_Create();
    if (format == nullptr) {
        cout << "Fatal: Failed to create format" << endl;
        return AV_ERR_UNKNOWN;
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, static_cast<int32_t>(DEFAULT_WIDTH));
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, static_cast<int32_t>(DEFAULT_HEIGHT));
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, static_cast<double>(DEFAULT_FRAME_RATE));
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ROTATION, static_cast<int32_t>(DEFAULT_ROTATION));
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, static_cast<int32_t>(DEFAULT_PIXEL_FORMAT));
    int ret = OH_VideoDecoder_Configure(vdec_, format);
    OH_AVFormat_Destroy(format);
    return ret;
}

int32_t VDecNdkSample::RunVideoDec_Surface(string codeName)
{
    (void)codeName;
    SURFACE_OUTPUT = true;
    cout << "RunVideoDec_Surface: no consumer Surface in HAP NDK path, skip" << endl;
    return AV_ERR_SURFACE_UNAVAILABLE_SKIP;
}

int32_t VDecNdkSample::RunVideoDec(string codeName)
{
    SURFACE_OUTPUT = false;
    int err = CreateVideoDecoder(codeName);
    if (err != AV_ERR_OK) {
        cout << "Failed to create video decoder" << endl;
        return err;
    }

    err = ConfigureVideoDecoder();
    if (err != AV_ERR_OK) {
        cout << "Failed to configure video decoder" << endl;
        Release();
        return err;
    }

    err = SetVideoDecoderCallback();
    if (err != AV_ERR_OK) {
        cout << "Failed to setCallback" << endl;
        Release();
        return err;
    }

    err = StartVideoDecoder();
    if (err != AV_ERR_OK) {
        cout << "Failed to start video decoder" << endl;
        Release();
        return err;
    }
    return err;
}

int32_t VDecNdkSample::SetVideoDecoderCallback()
{
    if (signal_ != nullptr) {
        delete signal_;
        signal_ = nullptr;
    }
    signal_ = new VDecSignal();
    if (signal_ == nullptr) {
        cout << "Failed to new VDecSignal" << endl;
        return AV_ERR_UNKNOWN;
    }

    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VdecInputDataReady;
    cb_.onNeedOutputData = VdecOutputDataReady;
    return OH_VideoDecoder_SetCallback(vdec_, cb_, static_cast<void*>(signal_));
}

void VDecNdkSample::ReleaseInFile()
{
    if (inFile_ != nullptr) {
        if (inFile_->is_open()) {
            inFile_->close();
        }
        inFile_.reset();
        inFile_ = nullptr;
    }
}

void VDecNdkSample::StopInloop()
{
    if (inputLoop_ != nullptr && inputLoop_->joinable() && signal_ != nullptr) {
        unique_lock<mutex> lock(signal_->inMutex_);
        clearIntqueue(signal_->inIdxQueue_);
        signal_->inCond_.notify_all();
        lock.unlock();

        inputLoop_->join();
        inputLoop_.reset();
    }
}

int32_t VDecNdkSample::StartVideoDecoder()
{
    int ret = OH_VideoDecoder_Start(vdec_);
    if (ret != AV_ERR_OK) {
        cout << "Failed to start codec" << endl;
        return ret;
    }

    isRunning_.store(true);

    inFile_ = make_unique<ifstream>();
    if (inFile_ == nullptr) {
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        return AV_ERR_UNKNOWN;
    }
    inFile_->open(INP_DIR, ios::in | ios::binary);
    if (!inFile_->is_open()) {
        cout << "open input file failed" << endl;
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        inFile_->close();
        inFile_.reset();
        inFile_ = nullptr;
        return AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP;
    }

    inputLoop_ = make_unique<thread>(&VDecNdkSample::InputFunc_AVCC, this);
    if (inputLoop_ == nullptr) {
        cout << "Failed to create input loop" << endl;
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        ReleaseInFile();
        return AV_ERR_UNKNOWN;
    }

    outputLoop_ = make_unique<thread>(&VDecNdkSample::OutputFunc, this);

    if (outputLoop_ == nullptr) {
        cout << "Failed to create output loop" << endl;
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        ReleaseInFile();
        StopInloop();
        Release();
        return AV_ERR_UNKNOWN;
    }
    return AV_ERR_OK;
}

int32_t VDecNdkSample::CreateVideoDecoder(string codeName)
{
    if (vdec_ != nullptr) {
        if (signal_ != nullptr) {
            delete signal_;
            signal_ = nullptr;
        }
        if (dec_sample == this) {
            dec_sample = nullptr;
        }
        (void)OH_VideoDecoder_Destroy(vdec_);
        vdec_ = nullptr;
    }
    if (!codeName.empty()) {
        vdec_ = OH_VideoDecoder_CreateByName(codeName.c_str());
    } else {
        vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    }
    dec_sample = this;
    return vdec_ == nullptr ? AV_ERR_UNKNOWN : AV_ERR_OK;
}

void VDecNdkSample::WaitForEOS()
{
    if (!AFTER_EOS_DESTORY_CODEC && inputLoop_ && inputLoop_->joinable()) {
        inputLoop_->join();
    }

    if (outputLoop_ && outputLoop_->joinable()) {
        outputLoop_->join();
    }
}

void VDecNdkSample::WriteOutputFrame(uint32_t index, OH_AVMemory* buffer, OH_AVCodecBufferAttr attr, FILE* outFile)
{
    if (!SURFACE_OUTPUT) {
        uint8_t* tmpBuffer = new uint8_t[attr.size];
        if (SecureMemcpy(tmpBuffer, attr.size, OH_AVMemory_GetAddr(buffer), attr.size) != EOK) {
            cout << "Fatal: memory copy failed" << endl;
        }
        (void)fwrite(tmpBuffer, 1, attr.size, outFile);
        delete[] tmpBuffer;
        if (OH_VideoDecoder_FreeOutputData(vdec_, index) != AV_ERR_OK) {
            cout << "Fatal: ReleaseOutputBuffer fail" << endl;
            errCount = errCount + 1;
        }
    } else {
        if (OH_VideoDecoder_RenderOutputData(vdec_, index) != AV_ERR_OK) {
            cout << "Fatal: RenderOutputBuffer fail" << endl;
            errCount = errCount + 1;
        }
    }
}

void VDecNdkSample::OutputFunc()
{
    FILE* outFile = fopen(OUT_DIR, "wb");
    if (outFile == nullptr) {
        return;
    }
    while (true) {
        if (!isRunning_.load()) {
            break;
        }
        if (signal_ == nullptr) {
            break;
        }
        unique_lock<mutex> lock(signal_->outMutex_);
        signal_->outCond_.wait(lock, [this]() {
            if (!isRunning_.load()) {
                cout << "quit out signal" << endl;
                return true;
            }
            return signal_->outIdxQueue_.size() > 0;
        });
        if (!isRunning_.load()) {
            break;
        }
        uint32_t index = signal_->outIdxQueue_.front();
        OH_AVCodecBufferAttr attr = signal_->attrQueue_.front();
        OH_AVMemory* buffer = signal_->outBufferQueue_.front();
        signal_->outBufferQueue_.pop();
        signal_->outIdxQueue_.pop();
        signal_->attrQueue_.pop();
        lock.unlock();
        if (attr.flags == AVCODEC_BUFFER_FLAGS_EOS) {
            (void)MdCompare(nullptr, 0, nullptr);
            if (AFTER_EOS_DESTORY_CODEC) {
                (void)Stop();
                Release();
            }
            break;
        }
        WriteOutputFrame(index, buffer, attr, outFile);
        if (errCount > 0) {
            break;
        }
    }
    (void)fclose(outFile);
}

void VDecNdkSample::Flush_buffer()
{
    if (signal_ == nullptr) {
        return;
    }
    unique_lock<mutex> inLock(signal_->inMutex_);
    clearIntqueue(signal_->inIdxQueue_);
    std::queue<OH_AVMemory*> empty;
    swap(empty, signal_->inBufferQueue_);
    signal_->inCond_.notify_all();
    inLock.unlock();
    unique_lock<mutex> outLock(signal_->outMutex_);
    clearIntqueue(signal_->outIdxQueue_);
    clearBufferqueue(signal_->attrQueue_);
    signal_->outCond_.notify_all();
    outLock.unlock();
}

void VDecNdkSample::CopyStartCode(uint8_t* frameBuffer, uint32_t bufferSize, OH_AVCodecBufferAttr& attr)
{
    switch (frameBuffer[START_CODE_SIZE] & H264_NALU_TYPE) {
        case SPS:
        case PPS:
        case SEI:
            if (SecureMemcpy(frameBuffer, bufferSize + START_CODE_SIZE, START_CODE, START_CODE_SIZE) != EOK) {
                cout << "Fatal: memory copy failed" << endl;
            }
            attr.pts = GetSystemTimeUs();
            attr.size = bufferSize + START_CODE_SIZE;
            attr.offset = 0;
            attr.flags = AVCODEC_BUFFER_FLAGS_CODEC_DATA;
            break;
        default: {
            if (SecureMemcpy(frameBuffer, bufferSize + START_CODE_SIZE, START_CODE, START_CODE_SIZE) != EOK) {
                cout << "Fatal: memory copy failed" << endl;
            }
            attr.pts = GetSystemTimeUs();
            attr.size = bufferSize + START_CODE_SIZE;
            attr.offset = 0;
            attr.flags = AVCODEC_BUFFER_FLAGS_NONE;
        }
    }
}

int32_t VDecNdkSample::ReadData(uint32_t index, OH_AVMemory* buffer)
{
    OH_AVCodecBufferAttr attr;
    if (BEFORE_EOS_INPUT && frameCount_ > EOS_COUNT) {
        SetEOS(index);
        return 1;
    }
    if (BEFORE_EOS_INPUT_INPUT && frameCount_ > EOS_COUNT) {
        (void)SecureMemset(&attr, sizeof(OH_AVCodecBufferAttr), 0, sizeof(OH_AVCodecBufferAttr));
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        BEFORE_EOS_INPUT_INPUT = false;
    }
    uint8_t ch[4] = {};
    (void)inFile_->read(reinterpret_cast<char*>(ch), START_CODE_SIZE);
    if (repeatRun && inFile_->eof()) {
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
        cout << "repeat" << endl;
        return 0;
    } else if (inFile_->eof()) {
        SetEOS(index);
        return 1;
    }
    uint32_t bufferSize = (static_cast<uint32_t>(ch[3] & 0xFF)) | (static_cast<uint32_t>(ch[2] & 0xFF) << EIGHT) |
                          (static_cast<uint32_t>(ch[1] & 0xFF) << SIXTEEN) |
                          (static_cast<uint32_t>(ch[0] & 0xFF) << TWENTY_FOUR);
    if (bufferSize > MAX_WIDTH * MAX_HEIGHT << 1) {
        return 1;
    }

    return static_cast<int32_t>(SendData(bufferSize, index, buffer));
}

uint32_t VDecNdkSample::SendData(uint32_t bufferSize, uint32_t index, OH_AVMemory* buffer)
{
    OH_AVCodecBufferAttr attr;
    uint8_t* frameBuffer = new uint8_t[bufferSize + START_CODE_SIZE];
    (void)inFile_->read(reinterpret_cast<char*>(frameBuffer + START_CODE_SIZE), bufferSize);
    CopyStartCode(frameBuffer, bufferSize, attr);
    int32_t size = OH_AVMemory_GetSize(buffer);
    if (size < static_cast<int32_t>(attr.size)) {
        delete[] frameBuffer;
        cout << "ERROR:AVMemory not enough, buffer size" << attr.size << "   AVMemory Size " << size << endl;
        isRunning_.store(false);
        StopOutloop();
        return 1;
    }
    uint8_t* buffer_addr = OH_AVMemory_GetAddr(buffer);
    if (SecureMemcpy(buffer_addr, static_cast<size_t>(size), frameBuffer, attr.size) != EOK) {
        delete[] frameBuffer;
        cout << "Fatal: memcpy fail" << endl;
        isRunning_.store(false);
        return 1;
    }
    delete[] frameBuffer;
    int32_t ret = OH_VideoDecoder_PushInputData(vdec_, index, attr);
    if (ret != AV_ERR_OK) {
        errCount++;
        cout << "push input data failed, error:" << ret << endl;
    }
    frameCount_ = frameCount_ + 1;
    if (inFile_->eof()) {
        isRunning_.store(false);
        StopOutloop();
    }
    return 0;
}

void VDecNdkSample::InputFunc_AVCC()
{
    frameCount_ = 1;
    errCount = 0;
    if (signal_ == nullptr) {
        return;
    }
    while (true) {
        if (!isRunning_.load()) {
            break;
        }
        if (frameCount_ % (EOS_COUNT >> 1) == 0) {
            if (REPEAT_START_FLUSH_BEFORE_EOS > 0) {
                REPEAT_START_FLUSH_BEFORE_EOS--;
                OH_VideoDecoder_Flush(vdec_);
                Flush_buffer();
                OH_VideoDecoder_Start(vdec_);
            }
            if (REPEAT_START_STOP_BEFORE_EOS > 0) {
                REPEAT_START_STOP_BEFORE_EOS--;
                OH_VideoDecoder_Stop(vdec_);
                Flush_buffer();
                OH_VideoDecoder_Start(vdec_);
            }
        }
        unique_lock<mutex> lock(signal_->inMutex_);
        signal_->inCond_.wait(lock, [this]() {
            if (!isRunning_.load()) {
                cout << "quit signal" << endl;
                return true;
            }
            return signal_->inIdxQueue_.size() > 0;
        });
        if (!isRunning_.load()) {
            break;
        }
        uint32_t index = signal_->inIdxQueue_.front();
        auto buffer = signal_->inBufferQueue_.front();
        signal_->inIdxQueue_.pop();
        signal_->inBufferQueue_.pop();
        lock.unlock();
        if (inFile_ != nullptr && !inFile_->eof()) {
            int ret = ReadData(index, buffer);
            if (ret == 1) {
                break;
            }
        }

        if (sleepOnFPS) {
            usleep(FRAME_INTERVAL);
        }
    }
}

void VDecNdkSample::SetEOS(uint32_t index)
{
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    int32_t res = OH_VideoDecoder_PushInputData(vdec_, index, attr);
    cout << "OH_VideoDecoder_PushInputData    EOS   res: " << res << endl;
}

int32_t VDecNdkSample::state_EOS()
{
    if (signal_ == nullptr) {
        return AV_ERR_UNKNOWN;
    }
    unique_lock<mutex> lock(signal_->inMutex_);
    signal_->inCond_.wait(lock, [this]() {
        if (!isRunning_.load()) {
            return true;
        }
        return signal_->inIdxQueue_.size() > 0;
    });
    uint32_t index = signal_->inIdxQueue_.front();
    signal_->inIdxQueue_.pop();
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    return OH_VideoDecoder_PushInputData(vdec_, index, attr);
}

int32_t VDecNdkSample::Flush()
{
    if (signal_ == nullptr) {
        return OH_VideoDecoder_Flush(vdec_);
    }
    unique_lock<mutex> inLock(signal_->inMutex_);
    clearIntqueue(signal_->inIdxQueue_);
    signal_->inCond_.notify_all();
    inLock.unlock();
    unique_lock<mutex> outLock(signal_->outMutex_);
    clearIntqueue(signal_->outIdxQueue_);
    clearBufferqueue(signal_->attrQueue_);
    signal_->outCond_.notify_all();
    outLock.unlock();

    return OH_VideoDecoder_Flush(vdec_);
}

int32_t VDecNdkSample::Reset()
{
    isRunning_.store(false);
    StopInloop();
    StopOutloop();
    ReleaseInFile();
    return OH_VideoDecoder_Reset(vdec_);
}

int32_t VDecNdkSample::Release()
{
    int ret = 0;
    if (vdec_ != nullptr) {
        ret = OH_VideoDecoder_Destroy(vdec_);
        vdec_ = nullptr;
    }

    if (signal_ != nullptr) {
        delete signal_;
        signal_ = nullptr;
    }
    if (dec_sample == this) {
        dec_sample = nullptr;
    }
    return ret;
}

int32_t VDecNdkSample::Stop()
{
    StopInloop();
    if (signal_ != nullptr) {
        unique_lock<mutex> lock(signal_->outMutex_);
        clearIntqueue(signal_->outIdxQueue_);
        clearBufferqueue(signal_->attrQueue_);
        signal_->outCond_.notify_all();
    }
    ReleaseInFile();
    return OH_VideoDecoder_Stop(vdec_);
}

int32_t VDecNdkSample::Start()
{
    int32_t ret = OH_VideoDecoder_Start(vdec_);
    if (ret == AV_ERR_OK) {
        isRunning_.store(true);
    }
    return ret;
}

void VDecNdkSample::StopOutloop()
{
    if (outputLoop_ != nullptr && outputLoop_->joinable() && signal_ != nullptr) {
        unique_lock<mutex> lock(signal_->outMutex_);
        clearIntqueue(signal_->outIdxQueue_);
        clearBufferqueue(signal_->attrQueue_);
        signal_->outCond_.notify_all();
        lock.unlock();
    }
}

int32_t VDecNdkSample::SetParameter(OH_AVFormat* format)
{
    return OH_VideoDecoder_SetParameter(vdec_, format);
}

int32_t VDecNdkSample::SetSurface(OHNativeWindow* window)
{
    return OH_VideoDecoder_SetSurface(vdec_, window);
}

void VDecNdkSample::ReleaseSignal()
{
    if (signal_ != nullptr) {
        delete signal_;
        signal_ = nullptr;
    }
}

bool VDecNdkSample::IsRender()
{
    return false;
}
