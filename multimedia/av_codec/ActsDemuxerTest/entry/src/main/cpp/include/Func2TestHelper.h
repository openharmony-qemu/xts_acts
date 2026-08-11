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

#ifndef FUNC2_TEST_HELPER_H
#define FUNC2_TEST_HELPER_H

#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avformat.h>
#include <cstdint>
#include <string>

constexpr int32_t TRACKNUM_0 = 0;
constexpr int32_t TRACKNUM_1 = 1;
constexpr int32_t TRACKNUM_2 = 2;
constexpr int32_t TRACKNUM_3 = 3;
constexpr int32_t TRACKNUM_4 = 4;
constexpr int32_t TRACKFRAME_231 = 231;
constexpr int32_t TRACKFRAME_431 = 431;
constexpr int32_t TRACKFRAME_16 = 16;
constexpr int32_t TRACKFRAME_77 = 77;
constexpr int32_t TRACKFRAME_223 = 223;
constexpr int32_t TRACKFRAME_417 = 417;
constexpr int64_t VIDEOTRACKSEEK = 900000;
constexpr int64_t AUDIOTRACKSEEK = 130604;
constexpr int32_t THOUSAND = 1000;
static const std::string TRACK_REF_TYPE_DEPTH = "vdep";
static const std::string TRACK_REF_TYPE_PREY = "auxl";
static const std::string TRACK_REF_TYPE_CDSC = "cdsc";
static const std::string AUXILIARY_DEPTH_TRACK_KEY = "com.openharmony.moviemode.depth";
static const std::string AUXILIARY_PREY_TRACK_KEY = "com.openharmony.moviemode.prey";
static const std::string TIMED_METADATA_KEY = "timed_metadata";

constexpr int EXPECTED_BUFFER_SIZE_2 = 2;
constexpr int EXPECTED_AUDIO_FRAMES_40 = 40;
constexpr int EXPECTED_AUDIO_FRAMES_20 = 20;
constexpr int EXPECTED_AUDIO_FRAMES_11 = 11;
constexpr int EXPECTED_AUDIO_FRAMES_21 = 21;
constexpr int EXPECTED_AUDIO_FRAMES_26 = 26;
constexpr int EXPECTED_AUDIO_FRAMES_59 = 59;
constexpr int EXPECTED_AUDIO_FRAMES_1876 = 1876;
constexpr int EXPECTED_SEEK_TIME_2487 = 2487;
constexpr int EXPECTED_SKIP_SAMPLE_COUNT_MP3 = 2;
constexpr int EXPECTED_AUDIO_FRAMES_3052 = 3052;
constexpr int EXPECTED_SKIP_SAMPLE_COUNT_OGG = 1;
constexpr int EXPECTED_AUDIO_FRAMES_6863 = 6863;
constexpr size_t SKIP_SAMPLE_BUFFER_SIZE = 10;
constexpr int MP3_SKIP_FRAME_INDEX_3051 = 3051;
constexpr int OGG_SKIP_FRAME_INDEX_6862 = 6862;

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

extern int32_t g_trackType;

int InitFile(const char *file, int32_t trackNum, int &fd);
int CloseFdAndReturn(int &fd);
int ProcessAuxTrackSample(AuxTrackSampleParams &params);
int InitSkipSampleFile(SkipSampleParams &params);
int ValidateSkipSampleResults(SkipSampleResultParams &params);
int GetDepthTrack0190();
int GetDepthTrack();
int GetPreyTrack();
int GetTimedMetaTrack();
int GetDepthAndIdsTrack();
int GetPreyAndIdsTrack();
void SetVideoValue(OH_AVCodecBufferAttr attr, bool &videoIsEnd, int &videoFrame);

#endif // FUNC2_TEST_HELPER_H
