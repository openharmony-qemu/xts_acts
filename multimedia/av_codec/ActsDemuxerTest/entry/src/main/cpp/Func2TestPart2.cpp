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

static const int32_t TRACKNUM_0 = 0;
static const int32_t TRACKNUM_1 = 1;
static const int32_t TRACKNUM_2 = 2;
static const int32_t TRACKNUM_3 = 3;
static const int32_t TRACKNUM_4 = 4;
static const int32_t TRACKFRAME_231 = 231;
static const int32_t TRACKFRAME_431 = 431;
static const int32_t TRACKFRAME_16 = 16;
static const int32_t TRACKFRAME_77 = 77;
static const int32_t TRACKFRAME_223 = 223;
static const int32_t TRACKFRAME_417 = 417;
static const int64_t VIDEOTRACKSEEK = 900000;
static const int64_t AUDIOTRACKSEEK = 130604;
static const int32_t THOUSAND = 1000;
static const std::string TRACK_REF_TYPE_DEPTH = "vdep";
static const std::string TRACK_REF_TYPE_PREY = "auxl";
static const std::string TRACK_REF_TYPE_CDSC = "cdsc";
static const std::string AUXILIARY_DEPTH_TRACK_KEY = "com.openharmony.moviemode.depth";
static const std::string AUXILIARY_PREY_TRACK_KEY = "com.openharmony.moviemode.prey";
static const std::string TIMED_METADATA_KEY = "timed_metadata";

static constexpr int EXPECTED_BUFFER_SIZE_2 = 2;
static constexpr int EXPECTED_AUDIO_FRAMES_40 = 40;
static constexpr int EXPECTED_AUDIO_FRAMES_20 = 20;
static constexpr int EXPECTED_AUDIO_FRAMES_11 = 11;
static constexpr int EXPECTED_AUDIO_FRAMES_21 = 21;
static constexpr int EXPECTED_AUDIO_FRAMES_26 = 26;
static constexpr int EXPECTED_AUDIO_FRAMES_59 = 59;
static constexpr int EXPECTED_AUDIO_FRAMES_1876 = 1876;
static constexpr int EXPECTED_SEEK_TIME_2487 = 2487;
static constexpr int EXPECTED_SKIP_SAMPLE_COUNT_MP3 = 2;
static constexpr int EXPECTED_AUDIO_FRAMES_3052 = 3052;
static constexpr int EXPECTED_SKIP_SAMPLE_COUNT_OGG = 1;
static constexpr int EXPECTED_AUDIO_FRAMES_6863 = 6863;
static constexpr size_t SKIP_SAMPLE_BUFFER_SIZE = 10;
static constexpr int MP3_SKIP_FRAME_INDEX_3051 = 3051;
static constexpr int OGG_SKIP_FRAME_INDEX_6862 = 6862;

struct AuxTrackSampleParams {
    int32_t trackIndex;
    int32_t expectedType;
    int (*validateFunc)();
    OH_AVCodecBufferAttr &bufferAttr;
    bool &videoIsEnd;
    int &videoFrame;
};

struct SkipSampleParams {
    const char *file;
    int &fd;
    int64_t &size;
    int32_t trackNum;
};

struct SkipSampleReadParams {
    int64_t size;
    OH_AVCodecBufferAttr &attr;
    OH_AVFormat *&format;
};

struct SkipSampleResultParams {
    int skipSampleCounts;
    int audioFrame;
    int aKeyCount;
    int expectedSkipCount;
    int expectedFrameCount;
    int fd;
};

extern int InitFile(const char *file, int32_t trackNum, int &fd);
extern int CloseFdAndReturn(int &fd);
extern int ProcessAuxTrackSample(AuxTrackSampleParams &params);
extern int InitSkipSampleFile(SkipSampleParams &params);
extern int GetDepthTrack0190();
extern int GetDepthTrack();
extern int GetPreyTrack();
extern int GetTimedMetaTrack();
extern int GetDepthAndIdsTrack();
extern int GetPreyAndIdsTrack();
extern void SetVideoValue(OH_AVCodecBufferAttr attr, bool &videoIsEnd, int &videoFrame);
extern int32_t g_trackType;

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
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsPrey = nullptr;
    size_t bufferSize;
    if (OH_AVDemuxer_SeekToTime(demuxer, AUDIOTRACKSEEK / THOUSAND, SEEK_MODE_NEXT_SYNC) != AV_ERR_OK) {
        return -1;
    }
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_2);
        if (trackFormat == nullptr) {
            return -1;
        }
        if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) {
            return -1;
        }
        if (OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_2, avBuffer) != AV_ERR_OK) {
            return -1;
        }
        if (avBuffer == nullptr) {
            return -1;
        }
        if (OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr) != AV_ERR_OK) {
            return -1;
        }
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE,
                &trackRefType))) {
                return -1;
            }
            if (strcmp(trackRefType, TRACK_REF_TYPE_PREY.c_str()) != 0) {
                return -1;
            }
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION,
                &trackdescription))) {
                return -1;
            }
            if (strcmp(trackdescription, AUXILIARY_PREY_TRACK_KEY.c_str()) != 0) {
                return -1;
            }
            if (!(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsPrey, &bufferSize))) {
                return -1;
            }
            if (bufferSize != TRACKNUM_2) {
                return -1;
            }
            if (trackIdsPrey[TRACKNUM_0] != TRACKNUM_0) {
                return -1;
            }
            if (trackIdsPrey[TRACKNUM_1] != TRACKNUM_1) {
                return -1;
            }
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
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
    const char *trackRefType = nullptr;
    const char *trackdescription = nullptr;
    int32_t *trackIdsDepth = nullptr;
    size_t bufferSize;
    if (OH_AVDemuxer_SeekToTime(demuxer, AUDIOTRACKSEEK / THOUSAND, SEEK_MODE_NEXT_SYNC) != AV_ERR_OK) {
        return -1;
    }
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, TRACKNUM_1);
        if (trackFormat == nullptr) {
            return -1;
        }
        if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &g_trackType))) {
            return -1;
        }
        if (OH_AVDemuxer_ReadSampleBuffer(demuxer, TRACKNUM_1, avBuffer) != AV_ERR_OK) {
            return -1;
        }
        if (avBuffer == nullptr) {
            return -1;
        }
        if (OH_AVBuffer_GetBufferAttr(avBuffer, &bufferAttr) != AV_ERR_OK) {
            return -1;
        }
        if (g_trackType == MEDIA_TYPE_AUXILIARY) {
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_REFERENCE_TYPE,
                &trackRefType))) {
                return -1;
            }
            if (strcmp(trackRefType, TRACK_REF_TYPE_DEPTH.c_str()) != 0) {
                return -1;
            }
            if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_TRACK_DESCRIPTION,
                &trackdescription))) {
                return -1;
            }
            if (strcmp(trackdescription, AUXILIARY_DEPTH_TRACK_KEY.c_str()) != 0) {
                return -1;
            }
            if (!(OH_AVFormat_GetIntBuffer(
                trackFormat, OH_MD_KEY_REFERENCE_TRACK_IDS, &trackIdsDepth, &bufferSize))) {
                return -1;
            }
            if (bufferSize != TRACKNUM_3) {
                return -1;
            }
            if (trackIdsDepth[TRACKNUM_0] != TRACKNUM_0) {
                return -1;
            }
            if (trackIdsDepth[TRACKNUM_1] != TRACKNUM_2) {
                return -1;
            }
            if (trackIdsDepth[TRACKNUM_2] != TRACKNUM_3) {
                return -1;
            }
            SetVideoValue(bufferAttr, videoIsEnd, videoFrame);
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
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
