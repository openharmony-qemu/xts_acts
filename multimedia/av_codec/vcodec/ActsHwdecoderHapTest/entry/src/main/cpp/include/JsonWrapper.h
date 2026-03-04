//
// Created on 2026/3/2.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef ACTSHWDECODERHAPTEST_JSONWRAPPER_H
#define ACTSHWDECODERHAPTEST_JSONWRAPPER_H

#include <string>
#include <unordered_map>

class JsonWrapper {
public:
    // 加载 JSON 文件
    bool LoadFromFile(const std::string& path);

    // 获取对应 fileName + pixFmt 的字符串
    std::string GetString(const std::string& fileName, const std::string& pixFmt) const;

private:
    std::string content_;

    // 一级 key -> 二级 key -> value
    std::unordered_map<std::string, std::unordered_map<std::string, std::string>> data_;

    // 内部辅助函数
    static std::string Trim(const std::string& s);
    static std::string StripQuotes(const std::string& s);
    bool ParseTopLevel();
    std::unordered_map<std::string, std::string> ParseInnerObject(size_t& pos);
    std::string ParseString(size_t& pos);
    void SkipWhitespace(size_t& pos);
};

#endif //ACTSHWDECODERHAPTEST_JSONWRAPPER_H
