/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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


#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avsource.h>
#include <multimedia/player_framework/native_avmemory.h>
#include "include/DemuxerHelperTest.h"
#include "include/FuncHelperTest.h"
#include "include/Func2TestHelper.h"
#include <hilog/log.h>
#include <iostream>
#include <cstdio>
#include <string>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <cmath>
#include <thread>

using namespace std;

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "DemuxerFunc2Test"

int DemuxerFunctionAudioTrack0150()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) {
        return -1;
    }
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    while (!videoIsEnd) {
        AuxTrackSampleParams params = {TRACKNUM_3, MEDIA_TYPE_TIMED_METADATA, GetTimedMetaTrack,
            bufferAttr, videoIsEnd, videoFrame};
        if (ProcessAuxTrackSample(params) != 0) {
            return -1;
        }
    }
    if (videoFrame != TRACKFRAME_231) {
        return -1;
    }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0160()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) {
        return -1;
    }
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    while (!videoIsEnd) {
        AuxTrackSampleParams params = {TRACKNUM_2, MEDIA_TYPE_AUXILIARY, GetPreyAndIdsTrack,
            bufferAttr, videoIsEnd, videoFrame};
        if (ProcessAuxTrackSample(params) != 0) {
            return -1;
        }
    }
    if (videoFrame != TRACKFRAME_431) {
        return -1;
    }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0170()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) {
        return -1;
    }
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    if (OH_AVDemuxer_SeekToTime(demuxer, AUDIOTRACKSEEK / THOUSAND, SEEK_MODE_NEXT_SYNC) != AV_ERR_OK) {
        return -1;
    }
    while (!videoIsEnd) {
        AuxTrackSampleParams params = {TRACKNUM_2, MEDIA_TYPE_AUXILIARY, GetPreyAndIdsTrack,
            bufferAttr, videoIsEnd, videoFrame};
        if (ProcessAuxTrackSample(params) != 0) {
            return -1;
        }
    }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0180()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) {
        return -1;
    }
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    while (!videoIsEnd) {
        AuxTrackSampleParams params = {TRACKNUM_1, MEDIA_TYPE_AUXILIARY, GetDepthAndIdsTrack,
            bufferAttr, videoIsEnd, videoFrame};
        if (ProcessAuxTrackSample(params) != 0) {
            return -1;
        }
    }
    if (videoFrame != TRACKFRAME_431) {
        return -1;
    }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAudioTrack0190()
{
    const char *file = "/data/storage/el2/base/files/media/Muxer_Auxiliary_02.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_4, fd);
    if (!(g_initResult)) {
        return -1;
    }
    bool videoIsEnd = false;
    int videoFrame = 0;
    OH_AVCodecBufferAttr bufferAttr;
    if (OH_AVDemuxer_SeekToTime(demuxer, AUDIOTRACKSEEK / THOUSAND, SEEK_MODE_NEXT_SYNC) != AV_ERR_OK) {
        return -1;
    }
    while (!videoIsEnd) {
        AuxTrackSampleParams params = {TRACKNUM_1, MEDIA_TYPE_AUXILIARY, GetDepthAndIdsTrack,
            bufferAttr, videoIsEnd, videoFrame};
        if (ProcessAuxTrackSample(params) != 0) {
            return -1;
        }
    }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAdd0010()
{
    const char *file = "/data/storage/el2/base/files/media/test_size_large.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_2, fd);
    if (!(g_initResult)) {
        return -1;
    }
    if (OH_AVDemuxer_SeekToTime(demuxer, EXPECTED_SEEK_TIME_2487, SEEK_MODE_NEXT_SYNC) != AV_ERR_UNKNOWN) {
        return -1;
    }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAdd0020()
{
    const char *file = "/data/storage/el2/base/files/media/test_size_large.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_2, fd);
    if (!(g_initResult)) {
        return -1;
    }
    if (OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_1, avBuffer) != AV_ERR_UNKNOWN) {
        return -1;
    }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerFunctionAdd0030()
{
    int32_t width = MEMORY_BUFFER_WIDTH;
    int32_t height = MEMORY_BUFFER_HEIGHT;
    memory = OH_AVMemory_Create(width * height);
    if (memory == nullptr) {
        return -1;
    }
    const char *file = "/data/storage/el2/base/files/media/test_size_large.mp4";
    int fd = 0;
    InitFile(file, TRACKNUM_2, fd);
    if (!(g_initResult)) {
        OH_AVMemory_Destroy(memory);
        memory = nullptr;
        return -1;
    }
    OH_AVCodecBufferAttr attr;
    int result = OH_AVDemuxer_ReadSample(demuxer, TRACKNUM_1, memory, &attr);
    OH_AVMemory_Destroy(memory);
    memory = nullptr;
    if (result != AV_ERR_UNKNOWN) {
        if (fd >= 0) {
            close(fd);
            fd = -1;
        }
        return -1;
    }
    if (fd >= 0) {
        close(fd);
        fd = -1;
    }
    return 0;
}

int DemuxerSkipSampleFunc0010()
{
    OH_AVCodecBufferAttr attr;
    bool audioIsEnd = false;
    int audioFrame = 0;
    int skipSampleCounts = 0;
    int aKeyCount = 0;
    const char *file = "/data/storage/el2/base/files/media/audio/MP3_8K_1.mp3";
    int fd = 0;
    int64_t size = 0;
    SkipSampleParams params = {file, fd, size, 1};
    if (InitSkipSampleFile(params) != 0) {
        return -1;
    }
    SkipSampleFrameContext ctx = {size, attr, audioFrame, skipSampleCounts, aKeyCount, audioIsEnd, fd};
    while (!audioIsEnd) {
        if (ProcessMp3SkipSampleFrame(ctx) != 0) {
            return -1;
        }
    }
    if (skipSampleCounts != EXPECTED_SKIP_SAMPLE_COUNT_MP3 || audioFrame != EXPECTED_AUDIO_FRAMES_3052 ||
        aKeyCount != EXPECTED_AUDIO_FRAMES_3052) {
        close(fd);
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerSkipSampleFunc0020()
{
    OH_AVCodecBufferAttr attr;
    int skipSampleCounts = 0;
    bool audioIsEnd = false;
    int audioFrame = 0;
    int aKeyCount = 0;
    const char *file = "/data/storage/el2/base/files/media/audio/OGG_8K_1.ogg";
    int fd = 0;
    int64_t size = 0;
    SkipSampleParams params = {file, fd, size, 1};
    if (InitSkipSampleFile(params) != 0) {
        return -1;
    }
    SkipSampleFrameContext ctx = {size, attr, audioFrame, skipSampleCounts, aKeyCount, audioIsEnd, fd};
    while (!audioIsEnd) {
        if (ProcessOggSkipSampleFrame(ctx) != 0) {
            return -1;
        }
    }
    if (skipSampleCounts != EXPECTED_SKIP_SAMPLE_COUNT_OGG || audioFrame != EXPECTED_AUDIO_FRAMES_6863 ||
        aKeyCount != EXPECTED_AUDIO_FRAMES_6863) {
        close(fd);
        return -1;
    }
    close(fd);
    return 0;
}
