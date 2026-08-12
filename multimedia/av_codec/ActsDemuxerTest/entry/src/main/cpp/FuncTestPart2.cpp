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

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "DemuxerFuncTest"

using namespace std;

int DemuxerFunction8000()
{
    const char *stringVal;
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }

    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
        return -1;
    }
    if (!(OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_TITLE, &stringVal))) {
        return -1;
    }
    if (strcmp(stringVal, "title") != 0) {
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction8100()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
        return -1;
    }
    const char *stringVal;
    if (OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_ALBUM, &stringVal)) {
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction8200()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
        return -1;
    }
    const char *stringVal;
    if (OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_ALBUM_ARTIST, &stringVal)) {
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction8300()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
        return -1;
    }
    const char *stringVal;
    if (!(OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_DATE, &stringVal))) {
        return -1;
    }
    if (strcmp(stringVal, "2023") != 0) {
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction8400()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
        return -1;
    }
    const char *stringVal;
    if (!(OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_COMMENT, &stringVal))) {
        return -1;
    }
    if (strcmp(stringVal, "COMMENT") != 0) {
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction8500()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
        return -1;
    }
    const char *stringVal;
    if (!(OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_GENRE, &stringVal))) {
        return -1;
    }
    if (strcmp(stringVal, "Classical") != 0) {
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction8600()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
        return -1;
    }
    const char *stringVal;
    if (OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_COPYRIGHT, &stringVal)) {
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction8700()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
        return -1;
    }
    const char *stringVal;
    if (OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_LANGUAGE, &stringVal)) {
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction8800()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
        return -1;
    }
    const char *stringVal;
    if (OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_DESCRIPTION, &stringVal)) {
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction8900()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
        return -1;
    }
    const char *stringVal;
    if (OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_LYRICS, &stringVal)) {
        return -1;
    }
    close(fd);
    return 0;
}

int DemuxerFunction9000()
{
    const char *file = "/data/storage/el2/base/files/media/01_video_audio.mp4";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr) {
        return -1;
    }
    const char *stringVal;
    if (!(OH_AVFormat_GetStringValue(sourceFormat, OH_MD_KEY_ARTIST, &stringVal))) {
        return -1;
    }
    if (strcmp(stringVal, "sam") != 0) {
        return -1;
    }
    close(fd);
    return 0;
}

int SubMediaDemuxerFunction0200()
{
    OH_AVCodecBufferAttr attr;
    bool audioIsEnd = false;
    int audioFrame = 0;
    const char *file = "/data/storage/el2/base/files/media/audio/amr_nb_8000_1.amr";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr ||
        !(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) {
        return -1;
    }
    if (g_trackCount != EXPECTED_TRACK_COUNT_SINGLE) {
        return -1;
    }
    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) {
        return -1;
    }
    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }
    int aKeyCount = 0;
    while (!audioIsEnd) {
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) {
            return -1;
        }
        SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
    }
    cout << file << "audioFrame " << audioFrame <<   "   aKeyCount " << aKeyCount  << endl;
    if (audioFrame != EXPECTED_AUDIO_FRAMES_1501) {
        return -1;
    }
    if (aKeyCount != EXPECTED_AUDIO_FRAMES_1501) {
        return -1;
    }
    close(fd);
    return 0;
}

int SubMediaDemuxerFunction0300()
{
    OH_AVCodecBufferAttr attr;
    bool audioIsEnd = false;
    int audioFrame = 0;
    const char *file = "/data/storage/el2/base/files/media/audio/amr_wb_16000_1.amr";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr ||
        !(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount))) {
        return -1;
    }
    if (g_trackCount != EXPECTED_TRACK_COUNT_SINGLE) {
        return -1;
    }
    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) {
        return -1;
    }
    memory = OH_AVMemory_Create(size);
    if (memory == nullptr) {
        close(fd);
        return -1;
    }
    int aKeyCount = 0;
    while (!audioIsEnd) {
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) {
            return -1;
        }
        SetAudioValue(attr, audioIsEnd, audioFrame, aKeyCount);
    }
    cout << file << "audioFrame " << audioFrame <<  "   aKeyCount " << aKeyCount << endl;
    if (audioFrame != EXPECTED_AUDIO_FRAMES_1500) {
        return -1;
    }
    if (aKeyCount != EXPECTED_AUDIO_FRAMES_1500) {
        return -1;
    }
    close(fd);
    return 0;
}

int SubMediaDemuxerFunction1000()
{
    const char *file = "/data/storage/el2/base/files/media/audio/amr_nb_8000_1.amr";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        return -1;
    }
    trackFormat = OH_AVSource_GetTrackFormat(source, 0);
    if (trackFormat == nullptr) {
        return -1;
    }
    const char *codecMime = "";
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, &codecMime))) {
        return -1;
    }
    cout << "codecMime" << codecMime << endl;
    if (strcmp(codecMime, OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB) != 0) {
        return -1;
    }
    close(fd);
    return 0;
}

int SubMediaDemuxerFunction1100()
{
    const char *file = "/data/storage/el2/base/files/media/audio/amr_wb_16000_1.amr";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        return -1;
    }
    trackFormat = OH_AVSource_GetTrackFormat(source, 0);
    if (trackFormat == nullptr) {
        return -1;
    }
    const char *codecMime = "";
    if (!(OH_AVFormat_GetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, &codecMime))) {
        return -1;
    }
    cout << "codecMime" << codecMime << endl;
    if (strcmp(codecMime, OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB) != 0) {
        return -1;
    }
    close(fd);
    return 0;
}

int SubMediaDemuxerFunction1200()
{
    if (access(HEVC_LIB_PATH.c_str(), F_OK) != 0) {
        return 0;
    }
    
    const char *file = "/data/storage/el2/base/files/media/hevc_v_a.ts";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        return -1;
    }
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    if (sourceFormat == nullptr || !(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount)) ||
        g_trackCount != EXPECTED_TRACK_COUNT_DUAL) {
        return -1;
    }

    for (int32_t index = 0; index < g_trackCount; index++) {
        if (OH_AVDemuxer_SelectTrackByID(demuxer, index) != AV_ERR_OK) {
            return -1;
        }
    }
    
    bool audioIsEnd = false;
    bool videoIsEnd = false;
    int audioFrame = 0;
    int videoFrame = 0;
    int aKeyCount = 0;
    int vKeyCount = 0;
    DualTrackParams params = {&audioIsEnd, &videoIsEnd, &audioFrame, &videoFrame, &aKeyCount, &vKeyCount};
    if (ProcessDualTrackLoop(params) != 0) {
        return -1;
    }
    if (audioFrame != EXPECTED_AUDIO_FRAMES_384 || aKeyCount != EXPECTED_AUDIO_FRAMES_384 ||
        videoFrame != EXPECTED_VIDEO_FRAMES_602 || vKeyCount != EXPECTED_KEY_FRAMES_3) {
        return -1;
    }
    close(fd);
    return 0;
}

static int ProcessVideoLoop1300(int &tarckType, OH_AVCodecBufferAttr &attr, bool &videoIsEnd,
    int &videoFrame, int &vKeyCount)
{
    while (!videoIsEnd) {
        trackFormat = OH_AVSource_GetTrackFormat(source, 0);
        if (trackFormat == nullptr) {
            return -1;
        }
        if (!(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType))) {
            return -1;
        }
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
        if (videoIsEnd && (tarckType == MEDIA_TYPE_VID)) {
            continue;
        }
        if (OH_AVDemuxer_ReadSample(demuxer, 0, memory, &attr) != AV_ERR_OK) {
            return -1;
        }
        SetVideoValue(attr, videoIsEnd, videoFrame, vKeyCount);
    }
    return 0;
}

int SubMediaDemuxerFunction1300()
{
    if (access(HEVC_LIB_PATH.c_str(), F_OK) != 0) {
        return 0;
    }
    int tarckType = 0;
    OH_AVCodecBufferAttr attr;
    bool videoIsEnd = false;
    int videoFrame = 0;
    const char *file = "/data/storage/el2/base/files/media/hevc_v.ts";
    int fd = open(file, O_RDONLY);
    int64_t size = GET_FILE_SIZE(file);
    cout << file << "----------------------" << fd << "---------" << size << endl;
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (source == nullptr) {
        return -1;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        return -1;
    }
    if (OH_AVDemuxer_SelectTrackByID(demuxer, 0) != AV_ERR_OK) {
        return -1;
    }
    int vKeyCount = 0;
    if (ProcessVideoLoop1300(tarckType, attr, videoIsEnd, videoFrame, vKeyCount) != 0) {
        return -1;
    }
    if (videoFrame != EXPECTED_VIDEO_FRAMES_602) {
        return -1;
    }
    if (vKeyCount != EXPECTED_KEY_FRAMES_3) {
        return -1;
    }
    close(fd);
    return 0;
}

void InitFuncTest() {}
