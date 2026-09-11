 /*
 	  * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "JsonWrapper.h"
#include <cctype>
#include <fstream>
#include <sstream>
#include <hilog/log.h>

const std::string DEFAULT_TAG = "ActsSwDecoderTest";
constexpr size_t FORMAT_PUBLIC_RESERVED = 25;
constexpr size_t PRINTF_BUFFER_SIZE = 1024;
constexpr int ERROR_CODE_NEGATIVE_ONE = -1;
constexpr int ERROR_CODE_NEGATIVE_TWO = -2;
constexpr int SUCCESS_CODE = 0;

void ConvertToPublic(const char* fmt, char* out, size_t outSize)
{
    const char* p = fmt;
    char* q = out;

    while (*p && static_cast<size_t>(q - out) < outSize - FORMAT_PUBLIC_RESERVED) {
        // 格式起点：% 但不是 %{public}
        if (*p == '%' && *(p + 1) != '{') {
            p++; // 跳过%
            // 写入 %{public}
            SafeMemcpy(q, outSize - (q - out), "%{public}", outSize - (q - out) - 1);
            q += strlen("%{public}");
            // 拷贝所有格式修饰符（如 03、-20、.2、ll、h 等）
            while (*p && strchr("0123456789.+-hlLjzt", *p)) {
                *q++ = *p++;
            }
            // 最终的类型符号（s d f p x c g u l 等等）
            if (*p) {
                *q++ = *p++;
            }

            continue;
        }
        // 普通字符
        *q++ = *p++;
    }

    *q = '\0';
}

void OHPrintf(const char* fmt, ...)
{
    char fmtPublic[PRINTF_BUFFER_SIZE];
    ConvertToPublic(fmt, fmtPublic, sizeof(fmtPublic));

    va_list args;
    va_start(args, fmt);
    OH_LOG_VPrint(LOG_APP, LOG_DEBUG, LOG_DOMAIN, DEFAULT_TAG.c_str(), fmtPublic, args);
    va_end(args);
}

int SafeMemcpy(void* dst, size_t dstSize, const void* src, size_t len)
{
    if (!dst || !src) {
        return ERROR_CODE_NEGATIVE_ONE;
    }
    if (len == 0) {
        return SUCCESS_CODE; // 空操作直接返回成功
    }
    if (len > dstSize) {
        return ERROR_CODE_NEGATIVE_TWO;
    }
    // 处理重叠情况的安全复制
    unsigned char* dstPtr = (unsigned char*)dst;
    const unsigned char* srcPtr = static_cast<const unsigned char*>(src);
    if (dstPtr == srcPtr) {
        return SUCCESS_CODE; // 源和目标相同，无需复制
    }
    // 判断是否有重叠以及重叠类型
    if (dstPtr < srcPtr) {
        // 正向复制：目标在源前面，或者不重叠
        for (size_t i = 0; i < len; ++i) {
            dstPtr[i] = srcPtr[i];
        }
    } else if (dstPtr > srcPtr) {
        // 反向复制：目标在源后面，有重叠
        for (size_t i = len; i > 0; --i) {
            dstPtr[i - 1] = srcPtr[i - 1];
        }
    }
    return SUCCESS_CODE;
}
 	 
bool JsonWrapper::LoadFromFile(const std::string& path)
{
    std::ifstream f(path, std::ios::in);
    if (!f.is_open()) {
        return false;
    }
 	 
    std::stringstream buffer;
    buffer << f.rdbuf();
    content_ = buffer.str();
    return ParseTopLevel();
}
 	 
std::string JsonWrapper::GetString(const std::string& fileName, const std::string& pixFmt) const
{
    auto itFile = data_.find(fileName);
    if (itFile != data_.end()) {
        auto itFmt = itFile->second.find(pixFmt);
        if (itFmt != itFile->second.end()) {
            return itFmt->second;
        }
    }
    return "";
}
 	 
// --------------------- 内部函数实现 ---------------------
 	 
std::string JsonWrapper::Trim(const std::string& s)
{
    size_t start = 0;
    while (start < s.size() && std::isspace(static_cast<unsigned char>(s[start])))
        start++;
    size_t end = s.size();
    while (end > start && std::isspace(static_cast<unsigned char>(s[end - 1])))
        end--;
    return s.substr(start, end - start);
}
 	 
namespace {
constexpr size_t MIN_QUOTED_STRING_LEN = 2;
}
 	 
std::string JsonWrapper::StripQuotes(const std::string& s)
{
    if (s.size() >= MIN_QUOTED_STRING_LEN && s.front() == '"' && s.back() == '"') {
        return s.substr(1, s.size() - MIN_QUOTED_STRING_LEN);
    }
    return s;
}
 	 
bool JsonWrapper::ParseTopLevel()
{
    size_t pos = 0;
    SkipWhitespace(pos);
    if (pos >= content_.size() || content_[pos] != '{')
        return false;
    pos++; // skip {
 	 
    while (pos < content_.size()) {
        SkipWhitespace(pos);
        if (content_[pos] == '}')
            break;
 	 
        std::string key = ParseString(pos);
        if (key.empty())
            return false;
        SkipWhitespace(pos);
        if (content_[pos] != ':')
            return false;
        pos++; // skip :
 	 
        auto valueMap = ParseInnerObject(pos);
        if (valueMap.empty())
            return false;
        data_[key] = std::move(valueMap);
 	 
        SkipWhitespace(pos);
        if (content_[pos] == ',')
            pos++;
    }
    return true;
}
 	 
std::unordered_map<std::string, std::string> JsonWrapper::ParseInnerObject(size_t& pos)
{
    std::unordered_map<std::string, std::string> map;
    SkipWhitespace(pos);
    if (pos >= content_.size() || content_[pos] != '{')
        return map;
    pos++; // skip {
    
    while (pos < content_.size()) {
        SkipWhitespace(pos);
        if (content_[pos] == '}') {
            pos++;
            break;
        }
        std::string key = ParseString(pos);
        SkipWhitespace(pos);
        if (content_[pos] != ':')
            return {};
        pos++; // skip :
        SkipWhitespace(pos);
        std::string value = ParseString(pos);
        map[key] = value;
        SkipWhitespace(pos);
        if (content_[pos] == ',')
            pos++;
    }
    return map;
}
 	 
std::string JsonWrapper::ParseString(size_t& pos)
{
    SkipWhitespace(pos);
    if (pos >= content_.size() || content_[pos] != '"')
        return "";
    pos++; // skip "
    size_t start = pos;
    while (pos < content_.size() && content_[pos] != '"')
        pos++;
    std::string result = content_.substr(start, pos - start);
    if (pos < content_.size())
        pos++; // skip ending "
    return result;
}
 	 
void JsonWrapper::SkipWhitespace(size_t& pos)
{
    while (pos < content_.size() && std::isspace(static_cast<unsigned char>(content_[pos])))
        pos++;
}