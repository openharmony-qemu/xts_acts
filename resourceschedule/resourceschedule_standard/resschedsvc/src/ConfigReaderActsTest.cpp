/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "config_reader_acts.h"

using namespace std;

namespace OHOS {
namespace ResourceScheduleActs {
namespace {
static const char* XML_TAG_RES_SCHED = "ressched";
static const char* XML_TAG_PLUGIN = "plugin";
static const char* XML_TAG_CONFIG = "config";
static const char* XML_TAG_ITEM = "item";
static const char* XML_ATTR_NAME = "name";
}

bool ConfigReaderActs::IsInvalidNode(const xmlNode& currNode)
{
    if (!currNode.name || currNode.type == XML_COMMENT_NODE) {
        return true;
    }
    return false;
}

void ConfigReaderActs::ParseProperties(const xmlNode& currNode, map<string, string>& properties)
{
    auto attrs = currNode.properties;
    xmlChar *value;
    for (; attrs; attrs = attrs->next) {
        auto name = attrs->name;
        if (!name) {
            continue;
        }
        value = xmlGetProp(&currNode, name);
        if (!value) {
            continue;
        }
        properties[reinterpret_cast<const char*>(name)] = reinterpret_cast<const char*>(value);
        xmlFree(value);
    }
}

void ConfigReaderActs::ParseSubItem(const xmlNode& parentNode, Item& item)
{
    auto currNodePtr = parentNode.xmlChildrenNode;
    xmlChar *value;
    for (; currNodePtr; currNodePtr = currNodePtr->next) {
        if (IsInvalidNode(*currNodePtr)) {
            continue;
        }
        SubItem subItem;
        ParseProperties(*currNodePtr, subItem.properties);
        subItem.name = reinterpret_cast<const char*>(currNodePtr->name);
        value = xmlNodeGetContent(currNodePtr);
        if (value) {
            string itemValue(reinterpret_cast<const char*>(value));
            subItem.value = std::move(itemValue);
            xmlFree(value);
        }
        item.subItemList.emplace_back(subItem);
    }
}

void ConfigReaderActs::ParseItem(const xmlNode& parentNode, PluginConfig& pluginConfig)
{
    auto currNodePtr = parentNode.xmlChildrenNode;
    for (; currNodePtr; currNodePtr = currNodePtr->next) {
        if (IsInvalidNode(*currNodePtr) ||
            xmlStrcmp(currNodePtr->name, reinterpret_cast<const xmlChar*>(XML_TAG_ITEM)) != 0) {
            continue;
        }
        Item item;
        ParseProperties(*currNodePtr, item.itemProperties);
        ParseSubItem(*currNodePtr, item);
        pluginConfig.itemList.emplace_back(item);
    }
}

void ConfigReaderActs::ParseConfig(const xmlNode& parentNode, PluginConfigMap& pluginConfigMap)
{
    auto currNodePtr = parentNode.xmlChildrenNode;
    for (; currNodePtr; currNodePtr = currNodePtr->next) {
        if (IsInvalidNode(*currNodePtr) ||
            xmlStrcmp(currNodePtr->name, reinterpret_cast<const xmlChar*>(XML_TAG_CONFIG)) != 0) {
            continue;
        }
        auto propName = xmlGetProp(currNodePtr, reinterpret_cast<const xmlChar*>(XML_ATTR_NAME));
        if (!propName) {
            continue;
        }

        string configName(reinterpret_cast<char*>(propName));
        xmlFree(propName);
        auto& pluginConfig = pluginConfigMap[configName];
        ParseItem(*currNodePtr, pluginConfig);
    }
}

bool ConfigReaderActs::ParsePluginConfig(const xmlNode& currNode, map<string, PluginConfigMap>& pluginConfigs)
{
    auto propName = xmlGetProp(&currNode, reinterpret_cast<const xmlChar*>(XML_ATTR_NAME));
    if (!propName) {
        return false;
    }
    string pluginName(reinterpret_cast<char*>(propName));
    xmlFree(propName);
    ParseConfig(currNode, pluginConfigs[pluginName]);
    return true;
}

bool ConfigReaderActs::LoadFromConfigContent(const string& content)
{
    // skip the empty string, else you will get empty node
    xmlDocPtr xmlDocPtr = xmlReadMemory(content.c_str(), content.length(), nullptr, nullptr,
        XML_PARSE_NOBLANKS | XML_PARSE_NOERROR | XML_PARSE_NOWARNING | XML_PARSE_NOENT);
    if (!xmlDocPtr) {
        return false;
    }
    xmlNodePtr rootNodePtr = xmlDocGetRootElement(xmlDocPtr);
    if (!rootNodePtr || !rootNodePtr->name ||
        xmlStrcmp(rootNodePtr->name, reinterpret_cast<const xmlChar*>(XML_TAG_RES_SCHED)) != 0) {
        xmlFreeDoc(xmlDocPtr);
        return false;
    }
    map<string, PluginConfigMap> allPluginConfigs;
    xmlNodePtr currNodePtr = rootNodePtr->xmlChildrenNode;
    for (; currNodePtr; currNodePtr = currNodePtr->next) {
        if (IsInvalidNode(*currNodePtr)) {
            continue;
        }
        bool ret = false;
        if (xmlStrcmp(currNodePtr->name, reinterpret_cast<const xmlChar*>(XML_TAG_PLUGIN)) == 0) {
            ret = ParsePluginConfig(*currNodePtr, allPluginConfigs);
        }
        if (!ret) {
            xmlFreeDoc(xmlDocPtr);
            return false;
        }
    }
    xmlFreeDoc(xmlDocPtr);
    lock_guard<mutex> autoLock(configMutex_);
    MergeConfigList(allPluginConfigs);
    return true;
}

void ConfigReaderActs::MergeConfigList(std::map<std::string, PluginConfigMap>& pluginConfigs)
{
    for (auto iter : pluginConfigs) {
        if (allPluginConfigs_.find(iter.first) == allPluginConfigs_.end()) {
            allPluginConfigs_[iter.first] = iter.second;
            continue;
        }
        MergePluginConfigMap(allPluginConfigs_[iter.first], iter.second);
    }
}

void ConfigReaderActs::MergePluginConfigMap(PluginConfigMap& curPluginConfigMap,
    const PluginConfigMap& nextPluginConfigMap)
{
    for (auto iter : nextPluginConfigMap) {
        curPluginConfigMap[iter.first] = iter.second;
    }
}
} // namespace ResourceScheduleActs
} // namespace OHOS
