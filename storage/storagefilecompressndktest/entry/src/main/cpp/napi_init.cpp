
#include "napi/native_api.h"
#include "native_common.h"
#include "hilog/log.h"
#include "oh_archive.h"
#include "oh_archive_errcode.h"
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include <string>
#include <vector>
#include <fstream>
#include <iostream>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200 
#define LOG_TAG "MY_TAG"

#define NO_ERR 0
#define SUCCESS 1
#define FAIL -1

#define ARCHIVE_OK 0


static OH_Archive_ProgressType progressHandler(int progress, void *userData)
{
    if (progress > 0) {
        OH_LOG_ERROR(LOG_APP, "Progress %{public}d", progress);
    }
    return OH_ARCHIVE_PROGRESS_CONTINUE;
}

static OH_Archive_ProgressType progressHandlerWithCancel(int progress, void * userData) {
    OH_LOG_ERROR(LOG_APP, "Progress %{public}d", progress);
    if (progress > 30) {
        OH_LOG_ERROR(LOG_APP, "Progress over %{public}d", progress);
        return OH_ARCHIVE_PROGRESS_CANCEL;
    }
    return OH_ARCHIVE_PROGRESS_CONTINUE;
}

static napi_value Archive_Compress(napi_env env, napi_callback_info info)
{   
    int ret;
    std::string file = "/data/storage/el2/base/temp/infile.txt";
    std::string content = "test content这是测试内容Hello, hello!第一行数据";

    std::ofstream stdfile(file, std::ios::out | std::ios::trunc);
    if (stdfile.is_open()) {
        stdfile << content;
        stdfile.close();
    } 
    std::vector<const char*> src;
    src.push_back(file.c_str());     

    std::string zipfile = "/data/storage/el2/base/zipfile.zip";
    OH_Archive_Writer_Ctx arc = OH_Archive_Writer_OpenFile(zipfile.c_str(), OH_ARCHIVE_OPEN_MODE_CREATE, OH_ARCHIVE_FMT_ZIP);
    NAPI_ASSERT(env, arc != nullptr, "OH_Archive_Writer_OpenFile failed");
    
    ret = OH_Archive_Writer_SetCompressMethod(arc, OH_ARCHIVE_COMPRESS_DEFLATE, int32_t(6));
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Writer_SetCompressMethod failed");
    
    OH_Archive_ProgressHandlerWithData progressHandlerFunc = progressHandler;
    ret = OH_Archive_Writer_SetProgressHandlerWithData(arc, progressHandlerFunc, nullptr);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Writer_SetProgressHandlerWithDat failed");
    
    ret = OH_Archive_Writer_Add(arc, src.data(), 1);
	NAPI_ASSERT(env, ret == ARCHIVE_OK, "OH_Archive_Writer_Add failed");
    
    ret = OH_Archive_Writer_Close(arc);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Writer_Close failed");


    OH_Archive_Reader_Ctx ctx = OH_Archive_Reader_OpenFile(zipfile.c_str());
    NAPI_ASSERT(env, ctx != nullptr, "OH_Archive_Reader_OpenFile failed ");

    int userData[2] = {0};
    ret = OH_Archive_Reader_SetProgressHandlerWithData(ctx, progressHandlerFunc, (void *)userData);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Reader_SetProgressHandlerWithData failed");

    const char *outDir = "/data/storage/el2/base/files";
    ret= OH_Archive_Reader_ExtractAllFile(ctx, outDir);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "OH_Archive_Reader_ExtractAllFile failed");

    ret = OH_Archive_Reader_Close(ctx);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "OH_Archive_Reader_Close failed");

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


static napi_value Archive_Compress_Muti_File(napi_env env, napi_callback_info info)
{   
    int ret;
    std::string infile1 = "/data/storage/el2/base/temp/infile1.txt";
    std::string infile2 = "/data/storage/el2/base/temp/infile2.txt";
    std::string content = "test content这是测试内容Hello, hello!第一行数据";
    std::ofstream stdfile1(infile1, std::ios::out | std::ios::trunc);
    if (stdfile1.is_open()) {
        stdfile1 << content;
        stdfile1.close();
    } 
    std::ofstream stdfile2(infile2, std::ios::out | std::ios::trunc);
    if (stdfile2.is_open()) {
        stdfile2 << content;
        stdfile2.close();
    } 
    std::vector<const char*> src_muti;
    src_muti.push_back(infile1.c_str());
    src_muti.push_back(infile2.c_str());
    uint64_t fileNum = src_muti.size();
    

    std::string zip_muti = "/data/storage/el2/base/zipfile_muti.zip";
    OH_Archive_Writer_Ctx arc = OH_Archive_Writer_OpenFile(zip_muti.c_str(), OH_ARCHIVE_OPEN_MODE_CREATE, OH_ARCHIVE_FMT_ZIP);
    NAPI_ASSERT(env, arc != nullptr, "Writer_OpenFile failed");
    
    ret = OH_Archive_Writer_SetCompressMethod(arc, OH_ARCHIVE_NO_COMPRESSION, int32_t(8));
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Writer_SetCompressMethod failed");
    
    OH_Archive_ProgressHandlerWithData progressHandlerFunc = progressHandler;
    ret = OH_Archive_Writer_SetProgressHandlerWithData(arc, progressHandlerFunc, nullptr);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Writer_SetProgressHandlerWithDat failed");
    
    ret = OH_Archive_Writer_Add(arc, src_muti.data(), fileNum);
	NAPI_ASSERT(env, ret == ARCHIVE_OK, "OH_Archive_Writer_Add failed");
    
    ret = OH_Archive_Writer_Close(arc);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Writer_Close failed");


    OH_Archive_Reader_Ctx ctx = OH_Archive_Reader_OpenFile(zip_muti.c_str());
    NAPI_ASSERT(env, ctx != nullptr, "OH_Archive_Reader_OpenFile failed ");

    int userData[2] = {0};
    ret = OH_Archive_Reader_SetProgressHandlerWithData(ctx, progressHandlerFunc, (void *)userData);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Reader_SetProgressHandlerWithData failed");

    const char *outDir = "/data/storage/el2/base/files";
    ret= OH_Archive_Reader_ExtractAllFile(ctx, outDir);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "OH_Archive_Reader_ExtractAllFile failed");

    ret = OH_Archive_Reader_Close(ctx);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "OH_Archive_Reader_Close failed");

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


static napi_value Archive_Compress_Cancel(napi_env env, napi_callback_info info)
{   
    int ret;
    std::string infile3 = "/data/storage/el2/base/temp/infilecancel.txt";
    std::string content = "test content这是测试内容Hello, hello!第一行数据";

    std::ofstream stdfile3(infile3, std::ios::out | std::ios::trunc);
    if (stdfile3.is_open()) {
        stdfile3 << content;
        stdfile3.close();
    } 
    std::vector<const char*> src3;
    src3.push_back(infile3.c_str());     

    std::string zip_cancel = "/data/storage/el2/base/zipcancel.zip";
    OH_Archive_Writer_Ctx arc = OH_Archive_Writer_OpenFile(zip_cancel.c_str(), OH_ARCHIVE_OPEN_MODE_CREATE, OH_ARCHIVE_FMT_ZIP);
    NAPI_ASSERT(env, arc != nullptr, "Writer_OpenFile failed");
    
    ret = OH_Archive_Writer_SetCompressMethod(arc, OH_ARCHIVE_COMPRESS_DEFLATE, int32_t(6));
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Writer_SetCompressMethod failed");
    
    OH_Archive_ProgressHandlerWithData progressHandlerFunc = progressHandlerWithCancel;
    ret = OH_Archive_Writer_SetProgressHandlerWithData(arc, progressHandlerFunc, nullptr);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Writer_SetProgressHandlerWithDat failed");
    
    ret = OH_Archive_Writer_Add(arc, src3.data(), 1);
	NAPI_ASSERT(env, ret == 13900101, "003 OH_Archive_Writer_Add failed");
    
    ret = OH_Archive_Writer_Close(arc);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Writer_Close failed");

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


static napi_value Archive_Decompress_Cancel(napi_env env, napi_callback_info info)
{   
    int ret;
    std::string file4 = "/data/storage/el2/base/temp/unzfile_cancel.txt";
    const size_t filesize = 3*1024*1024;
    std::vector<char> buffer(filesize);
    for (size_t i = 0; i < filesize; ++i) {
		buffer[i] = static_cast<uint8_t>(rand() % 256);
	}
    std::ofstream stdfile4(file4, std::ios::binary);
    if (stdfile4.is_open()) {
        stdfile4.write(buffer.data(), filesize);
        stdfile4.close();
    }
    std::vector<const char*> src_de;
    src_de.push_back(file4.c_str());

    std::string unz_cancel = "/data/storage/el2/base/temp/unzcancel.zip";
    OH_Archive_Writer_Ctx arc = OH_Archive_Writer_OpenFile(unz_cancel.c_str(), OH_ARCHIVE_OPEN_MODE_CREATE, OH_ARCHIVE_FMT_ZIP);
    NAPI_ASSERT(env, arc != nullptr, "Writer_OpenFile failed");
    
    ret = OH_Archive_Writer_SetCompressMethod(arc, OH_ARCHIVE_COMPRESS_DEFLATE, int32_t(6));
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Writer_SetCompressMethod failed");
    
    OH_Archive_ProgressHandlerWithData progressHandlerFunc = progressHandler;
    ret = OH_Archive_Writer_SetProgressHandlerWithData(arc, progressHandlerFunc, nullptr);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Writer_SetProgressHandlerWithDat failed");
    
    ret = OH_Archive_Writer_Add(arc, src_de.data(), 1);
	NAPI_ASSERT(env, ret == ARCHIVE_OK, "004 OH_Archive_Writer_Add failed");
    
    ret = OH_Archive_Writer_Close(arc);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Writer_Close failed");


    OH_Archive_Reader_Ctx ctx = OH_Archive_Reader_OpenFile(unz_cancel.c_str());
    NAPI_ASSERT(env, ctx != nullptr, "OH_Archive_Reader_OpenFile failed ");

    OH_Archive_ProgressHandlerWithData progressHandlercancel = progressHandlerWithCancel;
    int userData[2] = {0};
    ret = OH_Archive_Reader_SetProgressHandlerWithData(ctx, progressHandlercancel, (void *)userData);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Reader_SetProgressHandlerWithData failed");

    const char *outDir = "/data/storage/el2/base/files";
    ret= OH_Archive_Reader_ExtractAllFile(ctx, outDir);
    NAPI_ASSERT(env, ret == 13900101, "OH_Archive_Reader_ExtractAllFile failed");

    ret = OH_Archive_Reader_Close(ctx);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "OH_Archive_Reader_Close failed");

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


static napi_value Archive_Compress_Abnormal(napi_env env, napi_callback_info info)
{   
    int ret;
    std::string infile5 = "/data/storage/el2/base/temp/infile.txt";
    std::string content = "test content这是测试内容Hello, hello!第一行数据";

    std::ofstream stdfile5(infile5, std::ios::out | std::ios::trunc);
    if (stdfile5.is_open()) {
        stdfile5 << content;
        stdfile5.close();
    } 
    std::vector<const char*> src5;
    src5.push_back(infile5.c_str());
    
    std::string zipfile5 = "/data/storage/el2/base/zipfile5.zip";
    OH_Archive_Writer_Ctx arc = nullptr;
    arc = OH_Archive_Writer_OpenFile(NULL, OH_ARCHIVE_OPEN_MODE_CREATE, OH_ARCHIVE_FMT_ZIP);
    NAPI_ASSERT(env, arc == nullptr, "Writer_OpenFile abnormal params failed1");
    arc = OH_Archive_Writer_OpenFile(zipfile5.c_str(), (OH_Archive_OpenMode)3, OH_ARCHIVE_FMT_ZIP);
    NAPI_ASSERT(env, arc == nullptr, "Writer_OpenFile abnormal params failed2");
    arc = OH_Archive_Writer_OpenFile(zipfile5.c_str(), OH_ARCHIVE_OPEN_MODE_CREATE, (OH_Archive_Format)5);
    NAPI_ASSERT(env, arc == nullptr, "Writer_OpenFile abnormal params failed3");

    arc = OH_Archive_Writer_OpenFile(zipfile5.c_str(), OH_ARCHIVE_OPEN_MODE_CREATE, OH_ARCHIVE_FMT_ZIP);
    NAPI_ASSERT(env, arc != nullptr, "Writer_OpenFile failed");

    ret = OH_Archive_Writer_SetCompressMethod(nullptr, OH_ARCHIVE_COMPRESS_DEFLATE, int32_t(6));
    NAPI_ASSERT(env, ret == 401, "Writer_SetCompressMethod abnormal params failed1");
    ret = OH_Archive_Writer_SetCompressMethod(arc, (OH_Archive_CompressMethod)-1, -1);
    NAPI_ASSERT(env, ret == 401, "Writer_SetCompressMethod abnormal params failed2");
    ret = OH_Archive_Writer_SetCompressMethod(arc, (OH_Archive_CompressMethod)8, 10);
    NAPI_ASSERT(env, ret == 401, "Writer_SetCompressMethod abnormal params failed3");

    ret = OH_Archive_Writer_SetCompressMethod(arc, OH_ARCHIVE_COMPRESS_DEFLATE, int32_t(6));
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Writer_SetCompressMethod failed");

    OH_Archive_ProgressHandlerWithData progressHandlerFunc = progressHandler;
    int userData[2] = {0};
    ret = OH_Archive_Writer_SetProgressHandlerWithData(nullptr, progressHandlerFunc, (void *)userData);
    NAPI_ASSERT(env, ret == 401, "Writer_SetProgressHandlerWithDat abnormal params failed");
    ret = OH_Archive_Writer_SetProgressHandlerWithData(arc, nullptr, (void *)userData);
    NAPI_ASSERT(env, ret == 401, "Writer_SetProgressHandlerWithDat abnormal params failed2");
    ret = OH_Archive_Writer_SetProgressHandlerWithData(arc, progressHandlerFunc, nullptr);
    NAPI_ASSERT(env, ret == 0, "Writer_SetProgressHandlerWithDat normal params failed");

	ret = OH_Archive_Writer_Add(nullptr, src5.data(), 1);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_Writer_Add failed1");
    ret = OH_Archive_Writer_Add(arc, nullptr, 1);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_Writer_Add failed2");
    
    const char *fileAbnormal[] = {"xxxxxx"};
    ret = OH_Archive_Writer_Add(arc, fileAbnormal, 1);
    NAPI_ASSERT(env, ret == 13900201, "OH_Archive_Writer_Add failed3");

    
    std::string zipfile6 =  "./test/build/empty.txt";
    OH_Archive_Writer_Ctx arc2 = OH_Archive_Writer_OpenFile(zipfile6.c_str(), OH_ARCHIVE_OPEN_MODE_CREATE, OH_ARCHIVE_FMT_ZIP);
    ret = OH_Archive_Writer_Add(arc2, src5.data(), 1);
    NAPI_ASSERT(env, ret == 13900203, "OH_Archive_Writer_Add failed4");
    
    std::string zipfile7 = "/data/storage/el2/base/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                      "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                      "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                      "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                      "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxempty.txt";
    OH_Archive_Writer_Ctx arc3 = OH_Archive_Writer_OpenFile(zipfile7.c_str(), OH_ARCHIVE_OPEN_MODE_CREATE, OH_ARCHIVE_FMT_ZIP);
    ret = OH_Archive_Writer_Add(arc3, src5.data(), 1);
    NAPI_ASSERT(env, ret == 13900204, "OH_Archive_Writer_Add failed5");
    
    
    ret = OH_Archive_Writer_Add(arc, src5.data(), 1);
	NAPI_ASSERT(env, ret == ARCHIVE_OK, "OH_Archive_Writer_Add failed6");
    

	ret = OH_Archive_Writer_Close(NULL);
    NAPI_ASSERT(env, ret == 401, "Writer_Close failed");
    ret = OH_Archive_Writer_Close(arc);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Writer_Close failed");
    ret = OH_Archive_Writer_Close(arc2);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Writer_Close failed");
    ret = OH_Archive_Writer_Close(arc3);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Writer_Close failed");

    
    OH_Archive_Reader_Ctx ctx = nullptr;
    ctx = OH_Archive_Reader_OpenFile(nullptr);
    NAPI_ASSERT(env, ctx == nullptr, "Writer_OpenFile failed");
    ctx = OH_Archive_Reader_OpenFile(zipfile5.c_str());
    NAPI_ASSERT(env, ctx != nullptr, "Writer_OpenFile failed2");

    ret = OH_Archive_Reader_SetProgressHandlerWithData(nullptr, progressHandlerFunc, (void *)userData);
    NAPI_ASSERT(env, ret == 401, "Reader_SetProgressHandlerWithData failed");
    ret = OH_Archive_Reader_SetProgressHandlerWithData(ctx, nullptr, (void *)userData);
    NAPI_ASSERT(env, ret == 401, "Reader_SetProgressHandlerWithData faile2d");
    ret = OH_Archive_Reader_SetProgressHandlerWithData(ctx, progressHandlerFunc, nullptr);
    NAPI_ASSERT(env, ret == 401, "Reader_SetProgressHandlerWithData failed3");
    ret = OH_Archive_Reader_SetProgressHandlerWithData(ctx, progressHandlerFunc, (void *)userData);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "Reader_SetProgressHandlerWithData failed");
    
    const char *failDir = "/test/el2/base/files";
    const char *outDir = "/data/storage/el2/base/files";
    ret= OH_Archive_Reader_ExtractAllFile(nullptr, outDir);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_Reader_ExtractAllFile failed1");
    ret= OH_Archive_Reader_ExtractAllFile(ctx, failDir);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_Reader_ExtractAllFile failed2");

    ret= OH_Archive_Reader_ExtractAllFile(ctx, outDir);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "OH_Archive_Reader_ExtractAllFile failed3");

	ret = OH_Archive_Reader_Close(NULL);
    NAPI_ASSERT(env, ret == 401, "Writer_Close failed");
    ret = OH_Archive_Reader_Close(ctx);
    NAPI_ASSERT(env, ret == ARCHIVE_OK, "OH_Archive_Reader_Close failed");

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}




static napi_value Archive_Buffer_Test(napi_env env, napi_callback_info info)
{
	int ret;
	uint64_t dataSize = 1024 * 1024;
	uint8_t* srcBuffer = (uint8_t*)malloc(dataSize);
	NAPI_ASSERT(env, srcBuffer != nullptr, "malloc srcBuffer failed");

	for (size_t i = 0; i < dataSize; ++i) {
		srcBuffer[i] = static_cast<uint8_t>(rand() % 256);
	}

    uint64_t bound = OH_Archive_BufferWriteCompressBound((OH_Archive_CompressMethod)8, dataSize);
    uint64_t compressedSize = bound;
    uint8_t *compressedBuffer = (uint8_t *)malloc(compressedSize);
	NAPI_ASSERT(env, compressedBuffer != nullptr, "malloc srcBuffer failed");

	ret = OH_Archive_BufferWrite(compressedBuffer, &compressedSize, srcBuffer, dataSize, (OH_Archive_CompressMethod)8, int32_t(6));
	NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_Buffer_Write failed");


	uint8_t* decompressedBuffer = (uint8_t*)malloc(dataSize);
	NAPI_ASSERT(env, decompressedBuffer != nullptr, "malloc decompressedBuffer failed");
	uint64_t decompressedSize = dataSize;
	ret = OH_Archive_BufferRead(decompressedBuffer, &decompressedSize, compressedBuffer, compressedSize, (OH_Archive_CompressMethod)8);
	NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_Buffer_Read failed");

	bool isEqual = std::memcmp(decompressedBuffer, srcBuffer, dataSize) == 0;
	NAPI_ASSERT(env, isEqual, "Decompressed data does not match original");

	free(srcBuffer);
	free(compressedBuffer);
	free(decompressedBuffer);

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;

}



static napi_value Archive_Buffer_Test_Abnormal(napi_env env, napi_callback_info info)
{
	int ret;
	uint64_t dataSize = 1024 * 1024;
	uint8_t* srcBuffer = (uint8_t*)malloc(dataSize);
	NAPI_ASSERT(env, srcBuffer != nullptr, "malloc srcBuffer failed");
	for (size_t i = 0; i < dataSize; ++i) {
		srcBuffer[i] = static_cast<uint8_t>(rand() % 256);
	}
    
    uint64_t bound2 = OH_Archive_BufferWriteCompressBound((OH_Archive_CompressMethod)8, 0.1*dataSize);
    uint64_t compressedSize2 = bound2;
    uint8_t *compressedBuffer2 = (uint8_t *)malloc(compressedSize2);
    ret = OH_Archive_BufferWrite(compressedBuffer2, &compressedSize2, srcBuffer, dataSize, (OH_Archive_CompressMethod)8, int32_t(6));
	NAPI_ASSERT(env, ret == 13900108, "OH_Archive_Buffer_Write failed");
    
    uint64_t bound3 = OH_Archive_BufferWriteCompressBound((OH_Archive_CompressMethod)-10, dataSize);
    uint64_t compressedSize3 = bound3;
    uint8_t *compressedBuffer3 = (uint8_t *)malloc(compressedSize3);
    ret = OH_Archive_BufferWrite(compressedBuffer3, &compressedSize3, srcBuffer, dataSize, (OH_Archive_CompressMethod)8, int32_t(6));
	NAPI_ASSERT(env, ret == 13900108, "OH_Archive_Buffer_Write failed2");
    
    uint64_t bound = OH_Archive_BufferWriteCompressBound((OH_Archive_CompressMethod)8, dataSize);
    uint64_t compressedSize = bound;
    uint8_t *compressedBuffer = (uint8_t *)malloc(compressedSize);
	NAPI_ASSERT(env, compressedBuffer != nullptr, "malloc srcBuffer failed");
    
    ret = OH_Archive_BufferWrite(nullptr, &compressedSize, srcBuffer, dataSize, (OH_Archive_CompressMethod)8, int32_t(6));
	NAPI_ASSERT(env, ret == 401, "OH_Archive_Buffer_Write failed3");
	ret = OH_Archive_BufferWrite(compressedBuffer, nullptr, srcBuffer, dataSize, (OH_Archive_CompressMethod)8, int32_t(6));
	NAPI_ASSERT(env, ret == 401, "OH_Archive_Buffer_Write failed4");
    ret = OH_Archive_BufferWrite(compressedBuffer, &compressedSize, nullptr, dataSize, (OH_Archive_CompressMethod)8, int32_t(6));
	NAPI_ASSERT(env, ret == 401, "OH_Archive_Buffer_Write failed6");
    
    ret = OH_Archive_BufferWrite(compressedBuffer, &compressedSize, srcBuffer, 0,(OH_Archive_CompressMethod)8, int32_t(-2));
	NAPI_ASSERT(env, ret == 401, "OH_Archive_Buffer_Write failed 8");
    ret = OH_Archive_BufferWrite(compressedBuffer, &compressedSize, srcBuffer, dataSize, (OH_Archive_CompressMethod)-1, int32_t(6));
	NAPI_ASSERT(env, ret == 401, "OH_Archive_Buffer_Write faile9");
    
    uint64_t bound4 = OH_Archive_BufferWriteCompressBound((OH_Archive_CompressMethod)8, dataSize);
    uint64_t compressedSize4 = bound4;
    uint8_t *compressedBuffer4 = (uint8_t *)malloc(compressedSize4);
	NAPI_ASSERT(env, compressedBuffer4 != nullptr, "malloc srcBuffer failed");
    
    ret = OH_Archive_BufferWrite(compressedBuffer4, &compressedSize4, srcBuffer, dataSize, (OH_Archive_CompressMethod)8, int32_t(6));
	NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_Buffer_Write faile11");
    
    
	uint8_t* decompressedBuffer = (uint8_t*)malloc(dataSize);
	NAPI_ASSERT(env, decompressedBuffer != nullptr, "malloc decompressedBuffer failed");
	uint64_t decompressedSize = dataSize;
    
    ret = OH_Archive_BufferRead(nullptr, &decompressedSize, compressedBuffer4, compressedSize4, (OH_Archive_CompressMethod)8);
	NAPI_ASSERT(env, ret == 401, "OH_Archive_Buffer_Read failed");
    
    ret = OH_Archive_BufferRead(decompressedBuffer, nullptr, compressedBuffer4, compressedSize4, (OH_Archive_CompressMethod)8);
	NAPI_ASSERT(env, ret == 401, "OH_Archive_Buffer_Read failed");
    
    ret = OH_Archive_BufferRead(decompressedBuffer, &decompressedSize, nullptr, compressedSize4, (OH_Archive_CompressMethod)8);
	NAPI_ASSERT(env, ret == 401, "OH_Archive_Buffer_Read failed");
    
    ret = OH_Archive_BufferRead(decompressedBuffer, &decompressedSize, compressedBuffer4, 0, (OH_Archive_CompressMethod)8);
	NAPI_ASSERT(env, ret == 401, "OH_Archive_Buffer_Read failed");
    
    ret = OH_Archive_BufferRead(decompressedBuffer, &decompressedSize, compressedBuffer4, compressedSize4, (OH_Archive_CompressMethod)-1);
	NAPI_ASSERT(env, ret == 401, "OH_Archive_Buffer_Read failed");
    
    uint8_t* decompressedBuffer2 = (uint8_t*)malloc(10);
	NAPI_ASSERT(env, decompressedBuffer2 != nullptr, "malloc decompressedBuffer failed");
	uint64_t decompressedSize2 = 10;
    ret = OH_Archive_BufferRead(decompressedBuffer2, &decompressedSize2, compressedBuffer4, compressedSize4, (OH_Archive_CompressMethod)8);
	NAPI_ASSERT(env, ret == 13900108, "OH_Archive_Buffer_Read failed");
    
	free(srcBuffer);
	free(compressedBuffer);
    free(compressedBuffer2);
    free(compressedBuffer3);
    free(compressedBuffer4);
	free(decompressedBuffer);
    free(decompressedBuffer2);

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;

}




static uint64_t WriteHandler(const void* data, uint64_t size, void* user_data) {
    uint8_t* buffer = (uint8_t*)user_data;
    memcpy(buffer, data, size);
    return size;
}


static napi_value Archive_Stream_Test(napi_env env, napi_callback_info info)
{
	int ret;
    OH_Archive_Stream_Config config = {0};
    config.blockSize = 32 * 1024;
    config.threadNum = 8;
    config.checksum = OH_ARCHIVE_CRC32;
    config.method = (OH_Archive_CompressMethod)8;
    
    OH_Archive_StreamWrite_Ctx writeCtx = OH_Archive_StreamWrite_Create(config);
    NAPI_ASSERT(env, writeCtx != nullptr, "OH_Archive_StreamWrite_Create failed");

    ret = OH_Archive_StreamWrite_SetCompressLevel(writeCtx, int32_t(6));
	NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamWrite_Start failed");
    
	uint64_t srcSize = 30 * 1024;
	uint8_t* srcBuffer = (uint8_t*)malloc(srcSize);
	NAPI_ASSERT(env, srcBuffer != nullptr, "malloc srcBuffer failed");
	for (uint64_t i = 0; i < srcSize; ++i) {
		srcBuffer[i] = static_cast<uint8_t>(rand() % 256);
	}

	uint64_t zipSize = srcSize * 1.1;
	void* zipBuffer = (void*)malloc(zipSize);
	NAPI_ASSERT(env, zipBuffer != nullptr, "malloc zipBuffer failed");
    
    ret = OH_Archive_StreamWrite_Start(writeCtx, WriteHandler, zipBuffer);
    NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamWrite_Start failed");
    
    uint8_t* ptr = srcBuffer;
    size_t left = srcSize;

    while (left > 0) {
        size_t chunkSize = (left > 1024) ? 1024 : left;

        ret = OH_Archive_StreamWrite_Update(writeCtx, ptr, chunkSize);
        NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamWrite_Update failed");

        ptr += chunkSize;
        left -= chunkSize;
    }
    
	OH_Archive_StreamInfo compressInfo = {0, 0, 0};
    ret = OH_Archive_StreamWrite_End(writeCtx, &compressInfo);
    NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamWrite_End failed");
    
    OH_Archive_StreamWrite_Destroy(writeCtx);
    
    OH_Archive_StreamRead_Ctx readCtx = OH_Archive_StreamRead_Create(config);
    NAPI_ASSERT(env, readCtx != nullptr, "OH_Archive_StreamRead_Create failed");

	uint64_t unzipSize = srcSize;
	void* unzipBuffer = (void*)malloc(unzipSize);
	NAPI_ASSERT(env, unzipBuffer != nullptr, "malloc unzipBuffer failed");

    ret = OH_Archive_StreamRead_Start(readCtx, WriteHandler, unzipBuffer);
    NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamRead_Start failed");
    
    uint8_t* unzPtr = (uint8_t*)zipBuffer;
    size_t unzLeft = compressInfo.totalOutSize;

    while (unzLeft > 0) {
        size_t unzchunk = (unzLeft > 1024) ? 1024 : unzLeft;

        ret = OH_Archive_StreamRead_Update(readCtx, unzPtr, unzchunk);
        NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamRead_Update failed");

        unzPtr += unzchunk;
        unzLeft -= unzchunk;
    }

    OH_Archive_StreamInfo decompressInfo2 = {};
    ret = OH_Archive_StreamRead_End(readCtx, &decompressInfo2);
    NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamRead_End failed");

    OH_Archive_StreamRead_Destroy(readCtx);

	free(srcBuffer);
	free(zipBuffer);
	free(unzipBuffer);

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


static napi_value Archive_Stream_ZipQuit(napi_env env, napi_callback_info info)
{
	int ret;
    OH_Archive_Stream_Config config = {0};
    config.blockSize = 32 * 1024;
    config.threadNum = 8;
    config.checksum = OH_ARCHIVE_CRC32;
    config.method = (OH_Archive_CompressMethod)8;
    
    OH_Archive_StreamWrite_Ctx writeCtx = OH_Archive_StreamWrite_Create(config);
    NAPI_ASSERT(env, writeCtx != nullptr, "OH_Archive_StreamWrite_Create failed");

    ret = OH_Archive_StreamWrite_SetCompressLevel(writeCtx, int32_t(6));
	NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamWrite_Start failed");
    
	uint64_t srcSize = 30 * 1024;
	uint8_t* srcBuffer = (uint8_t*)malloc(srcSize);
	NAPI_ASSERT(env, srcBuffer != nullptr, "malloc srcBuffer failed");
	for (uint64_t i = 0; i < srcSize; ++i) {
		srcBuffer[i] = static_cast<uint8_t>(rand() % 256);
	}

	uint64_t zipSize = srcSize * 1.1;
	void* zipBuffer = (void*)malloc(zipSize);
	NAPI_ASSERT(env, zipBuffer != nullptr, "malloc zipBuffer failed");
    
    ret = OH_Archive_StreamWrite_Start(writeCtx, WriteHandler, zipBuffer);
    NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamWrite_Start failed");

    uint8_t* ptr = srcBuffer;
    size_t left = srcSize;

    while (left > 0) {
        size_t chunkSize = (left > 1024) ? 1024 : left;
        
        if (left < 20*1024) {
            ret = OH_Archive_StreamWrite_Cancel(writeCtx);
            NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamWrite_Cancel failed");
            ret = OH_Archive_StreamWrite_Update(writeCtx, ptr, chunkSize);
            NAPI_ASSERT(env, ret == 13900101, "OH_Archive_StreamWrite_Update failed");
            break;
        }
        ret = OH_Archive_StreamWrite_Update(writeCtx, ptr, chunkSize);
        NAPI_ASSERT(env, ret == 0, "OH_Archive_StreamWrite_Update failed");
        ptr += chunkSize;
        left -= chunkSize;
    }

	OH_Archive_StreamInfo compressInfo = {0, 0, 0};
    ret = OH_Archive_StreamWrite_End(writeCtx, &compressInfo);
    NAPI_ASSERT(env, ret == 13900101, "OH_Archive_StreamWrite_End failed");

    OH_Archive_StreamWrite_Destroy(writeCtx);

	free(srcBuffer);
	free(zipBuffer);

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}



static napi_value Archive_Stream_UnzipQuit(napi_env env, napi_callback_info info)
{
	int ret;
    OH_Archive_Stream_Config config = {0};
    config.blockSize = 32 * 1024;
    config.threadNum = 8;
    config.checksum = OH_ARCHIVE_CRC32;
    config.method = (OH_Archive_CompressMethod)8;
    
    OH_Archive_StreamWrite_Ctx writeCtx = OH_Archive_StreamWrite_Create(config);
    NAPI_ASSERT(env, writeCtx != nullptr, "OH_Archive_StreamWrite_Create failed");

    ret = OH_Archive_StreamWrite_SetCompressLevel(writeCtx, int32_t(6));
	NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamWrite_Start failed");
    
	uint64_t srcSize = 30 * 1024;
	uint8_t* srcBuffer = (uint8_t*)malloc(srcSize);
	NAPI_ASSERT(env, srcBuffer != nullptr, "malloc srcBuffer failed");
	for (uint64_t i = 0; i < srcSize; ++i) {
		srcBuffer[i] = static_cast<uint8_t>(rand() % 256);
	}

	uint64_t zipSize = srcSize * 1.1;
	void* zipBuffer = (void*)malloc(zipSize);
	NAPI_ASSERT(env, zipBuffer != nullptr, "malloc zipBuffer failed");
    
    ret = OH_Archive_StreamWrite_Start(writeCtx, WriteHandler, zipBuffer);
    NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamWrite_Start failed");
    
    uint8_t* ptr = srcBuffer;
    size_t left = srcSize;
    while (left > 0) {
        size_t chunkSize = (left > 1024) ? 1024 : left;
        ret = OH_Archive_StreamWrite_Update(writeCtx, ptr, chunkSize);
        NAPI_ASSERT(env, ret == 0, "OH_Archive_StreamWrite_Update failed");
        ptr += chunkSize;
        left -= chunkSize;
    }
    
	OH_Archive_StreamInfo compressInfo = {0, 0, 0};
    ret = OH_Archive_StreamWrite_End(writeCtx, &compressInfo);
    NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamWrite_End failed");
    
    OH_Archive_StreamWrite_Destroy(writeCtx);
    
    OH_Archive_StreamRead_Ctx readCtx = OH_Archive_StreamRead_Create(config);
    NAPI_ASSERT(env, readCtx != nullptr, "OH_Archive_StreamRead_Create failed");

	uint64_t unzipSize = srcSize;
	void* unzipBuffer = (void*)malloc(unzipSize);
	NAPI_ASSERT(env, unzipBuffer != nullptr, "malloc unzipBuffer failed");

    ret = OH_Archive_StreamRead_Start(readCtx, WriteHandler, unzipBuffer);
    NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamRead_Start failed");


    uint8_t* unzPtr = (uint8_t*)zipBuffer;
    size_t unzLeft = compressInfo.totalOutSize;

    while (unzLeft > 0) {
        size_t unzchunk = (unzLeft > 1024) ? 1024 : unzLeft;
        if (unzLeft < 20*1024) {
            ret = OH_Archive_StreamRead_Cancel(readCtx);
            NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamWrite_Cancel failed");
            ret = OH_Archive_StreamRead_Update(readCtx, unzPtr, unzchunk);
            NAPI_ASSERT(env, ret == 13900101, "OH_Archive_StreamWrite_Update failed");
            break;
        }
        ret = OH_Archive_StreamRead_Update(readCtx, unzPtr, unzchunk);
        NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamRead_Update failed");

        unzPtr += unzchunk;
        unzLeft -= unzchunk;
    }

    OH_Archive_StreamInfo *decompressInfo2 = nullptr;
    ret = OH_Archive_StreamRead_End(readCtx, decompressInfo2);
    NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamRead_End failed");

    OH_Archive_StreamRead_Destroy(readCtx);

	free(srcBuffer);
	free(zipBuffer);
	free(unzipBuffer);

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


static napi_value Archive_Stream_Test_Abnormal(napi_env env, napi_callback_info info)
{
    OH_Archive_Stream_Config config1 = {0};
    config1.blockSize = 32 * 1024 -1;
    config1.threadNum = 8;
    config1.checksum = OH_ARCHIVE_CRC32;
    config1.method = (OH_Archive_CompressMethod)8;
    OH_Archive_StreamWrite_Ctx writeCtx1 = OH_Archive_StreamWrite_Create(config1);
    NAPI_ASSERT(env, writeCtx1 == nullptr, "OH_Archive_StreamWrite_Create config1 failed");
    
    OH_Archive_Stream_Config config2 = {0};
    config2.blockSize = 64 * 1024;
    config2.threadNum = 8;
    config2.checksum = (OH_Archive_StreamChecksum)-1;
    config2.method = (OH_Archive_CompressMethod)8;
    OH_Archive_StreamWrite_Ctx writeCtx2 = OH_Archive_StreamWrite_Create(config2);
    NAPI_ASSERT(env, writeCtx2 == nullptr, "OH_Archive_StreamWrite_Create config2 failed");
    
    OH_Archive_Stream_Config config3 = {0};
    config3.blockSize = 64 * 1024;
    config3.threadNum = 8;
    config3.checksum = OH_ARCHIVE_CRC32;
    config3.method = (OH_Archive_CompressMethod)7;
    OH_Archive_StreamWrite_Ctx writeCtx3 = OH_Archive_StreamWrite_Create(config3);
    NAPI_ASSERT(env, writeCtx3 == nullptr, "OH_Archive_StreamWrite_Create config2 failed");

    
    OH_Archive_Stream_Config config = {0};
    config.blockSize = 64 * 1024;
    config.threadNum = 8;
    config.checksum = OH_ARCHIVE_NO_CHECKSUM;
    config.method = (OH_Archive_CompressMethod)8;
    
    OH_Archive_StreamWrite_Ctx writeCtx = OH_Archive_StreamWrite_Create(config);
    NAPI_ASSERT(env, writeCtx != nullptr, "OH_Archive_StreamWrite_Create failed");
    
    int ret;
    ret = OH_Archive_StreamWrite_SetCompressLevel(nullptr, int32_t(6));
	NAPI_ASSERT(env, ret == 401, "OH_Archive_StreamWrite_Start failed");
    ret = OH_Archive_StreamWrite_SetCompressLevel(writeCtx, int32_t(-2));
	NAPI_ASSERT(env, ret == 401, "OH_Archive_StreamWrite_Start failed");
    
    ret = OH_Archive_StreamWrite_SetCompressLevel(writeCtx, int32_t(6));
	NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamWrite_Start failed");
    
	uint64_t srcSize = 30 * 1024;
	uint8_t* srcBuffer = (uint8_t*)malloc(srcSize);
	NAPI_ASSERT(env, srcBuffer != nullptr, "malloc srcBuffer failed");
	for (uint64_t i = 0; i < srcSize; ++i) {
		srcBuffer[i] = static_cast<uint8_t>(rand() % 256);
	}

	uint64_t zipSize = srcSize * 1.1;
	void* zipBuffer = (void*)malloc(zipSize);
	NAPI_ASSERT(env, zipBuffer != nullptr, "malloc zipBuffer failed");
    
    ret = OH_Archive_StreamWrite_Start(nullptr, WriteHandler, zipBuffer);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_StreamWrite_Start first params failed");
    ret = OH_Archive_StreamWrite_Start(writeCtx, nullptr, zipBuffer);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_StreamWrite_Start second params failed");
    ret = OH_Archive_StreamWrite_Start(writeCtx, WriteHandler, nullptr);
    NAPI_ASSERT(env, ret == 0, "OH_Archive_StreamWrite_Start third params failed");
    
    ret = OH_Archive_StreamWrite_Start(writeCtx, WriteHandler, zipBuffer);
    NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamWrite_Start failed");
    
    uint8_t* ptr = srcBuffer;
    size_t left = srcSize;
    
    ret = OH_Archive_StreamWrite_Cancel(nullptr);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_StreamWrite_Cancel failed");
    ret = OH_Archive_StreamWrite_Update(nullptr, ptr, srcSize);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_StreamWrite_Update failed");
    ret = OH_Archive_StreamWrite_Update(writeCtx, nullptr, srcSize);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_StreamWrite_Update failed");
    ret = OH_Archive_StreamWrite_Update(writeCtx, ptr, 0);
    NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamWrite_Update failed");

    while (left > 0) {
        size_t chunkSize = (left > 1024) ? 1024 : left;

        ret = OH_Archive_StreamWrite_Update(writeCtx, ptr, chunkSize);
        NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamWrite_Update failed");

        ptr += chunkSize;
        left -= chunkSize;
    }
    
	OH_Archive_StreamInfo compressInfo = {0, 0, 0};
    ret = OH_Archive_StreamWrite_End(nullptr, &compressInfo);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_StreamWrite_End first params failed");
    OH_Archive_StreamWrite_Ctx writeCtx4 = OH_Archive_StreamWrite_Create(config);
    ret = OH_Archive_StreamWrite_End(writeCtx4, nullptr);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_StreamWrite_End second params failed");
    
    
    ret = OH_Archive_StreamWrite_End(writeCtx, &compressInfo);
    NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamWrite_End failed");
    
    OH_Archive_StreamWrite_Destroy(writeCtx);
    OH_Archive_StreamWrite_Destroy(writeCtx4);
    
    OH_Archive_StreamRead_Ctx readCtx1 = OH_Archive_StreamRead_Create(config1);
    NAPI_ASSERT(env, readCtx1 != nullptr, "OH_Archive_StreamRead_Create failed");
    OH_Archive_StreamRead_Ctx readCtx2 = OH_Archive_StreamRead_Create(config2);
    NAPI_ASSERT(env, readCtx2 != nullptr, "OH_Archive_StreamRead_Create failed1");
    OH_Archive_StreamRead_Ctx readCtx3 = OH_Archive_StreamRead_Create(config3);
    NAPI_ASSERT(env, readCtx3 == nullptr, "OH_Archive_StreamRead_Create failed");
    
    OH_Archive_StreamRead_Ctx readCtx = OH_Archive_StreamRead_Create(config);
    NAPI_ASSERT(env, readCtx != nullptr, "OH_Archive_StreamRead_Create failed");

	uint64_t unzipSize = srcSize;
	void* unzipBuffer = (void*)malloc(unzipSize);
	NAPI_ASSERT(env, unzipBuffer != nullptr, "malloc unzipBuffer failed");
    
    ret = OH_Archive_StreamRead_Start(nullptr, WriteHandler, unzipBuffer);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_StreamRead_Start failed");
    ret = OH_Archive_StreamRead_Start(readCtx1, nullptr, unzipBuffer);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_StreamRead_Start failed");
    ret = OH_Archive_StreamRead_Start(readCtx1, WriteHandler, nullptr);
    NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamRead_Start failed");
    ret = OH_Archive_StreamRead_Start(readCtx, WriteHandler, unzipBuffer);
    NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamRead_Start failed");
    
    uint8_t* unzPtr = (uint8_t*)zipBuffer;
    size_t unzLeft = compressInfo.totalOutSize;
    ret = OH_Archive_StreamRead_Cancel(nullptr);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_StreamRead_Abort failed");
    ret = OH_Archive_StreamRead_Update(nullptr, unzPtr, unzLeft);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_StreamRead_Update failed");
    ret = OH_Archive_StreamRead_Update(readCtx, nullptr, unzLeft);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_StreamRead_Update failed");
    ret = OH_Archive_StreamRead_Update(readCtx, unzPtr, 0);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_StreamRead_Update failed");

    while (unzLeft > 0) {
        size_t unzchunk = (unzLeft > 1024) ? 1024 : unzLeft;

        ret = OH_Archive_StreamRead_Update(readCtx, unzPtr, unzchunk);
        NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamRead_Update failed");

        unzPtr += unzchunk;
        unzLeft -= unzchunk;
    }

    OH_Archive_StreamInfo decompressInfo2 = {};
    ret = OH_Archive_StreamRead_End(nullptr, &decompressInfo2);
    NAPI_ASSERT(env, ret == 401, "OH_Archive_StreamRead_End failed");
    ret = OH_Archive_StreamRead_End(readCtx2, nullptr);
    NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamRead_End failed");
    
    ret = OH_Archive_StreamRead_End(readCtx, &decompressInfo2);
    NAPI_ASSERT(env, ret == OH_ARCHIVE_OK, "OH_Archive_StreamRead_End failed");

    OH_Archive_StreamRead_Destroy(readCtx);
    OH_Archive_StreamRead_Destroy(readCtx1);
    OH_Archive_StreamRead_Destroy(readCtx2);
	free(srcBuffer);
	free(zipBuffer);
	free(unzipBuffer);

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}



EXTERN_C_START
    
#define FUNC_DESC(func) { #func, nullptr, func, nullptr, nullptr, nullptr, napi_default, nullptr }

static napi_property_descriptor g_desc[] = {
    {"archive_compress", nullptr, Archive_Compress, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"archive_compress_muti_file", nullptr, Archive_Compress_Muti_File, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"archive_compress_cancel", nullptr, Archive_Compress_Cancel, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"archive_decompress_cancel", nullptr, Archive_Decompress_Cancel, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"archive_compress_abnormal", nullptr, Archive_Compress_Abnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"archive_buffer_test", nullptr, Archive_Buffer_Test, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"archive_buffer_test_abnormal", nullptr, Archive_Buffer_Test_Abnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"archive_stream_test", nullptr, Archive_Stream_Test, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"archive_stream_zipquit", nullptr, Archive_Stream_ZipQuit, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"archive_stream_unzipquit", nullptr, Archive_Stream_UnzipQuit, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"archive_stream_test_abnormal", nullptr, Archive_Stream_Test_Abnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
};

static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(g_desc) / sizeof(g_desc[0]), g_desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
