# Functions

本模块提供URI编码和解码相关的全局函数。推荐优先使用`encodeURI`、`decodeURI`、`encodeURIComponent`和`decodeURIComponent`；`escape`和`unescape`仅用于兼容旧代码。

> **说明：**
>
> - 本模块仅适用于ArkTS-Sta。
>
> - 本模块首批接口从API version 20开始支持。后续版本的新增接口，采用上角标单独标记接口的起始版本。

## decodeURI

export function decodeURI(uri: string): string

解码由`encodeURI`或兼容方式编码的完整URI。URI保留字符会保持转义形式。

## encodeURI

export function encodeURI(uri: string): string

编码完整URI。该函数会保留URI语法字符，例如`:`、`/`、`?`和`#`。

## decodeURIComponent

export function decodeURIComponent(uriComponent: string): string

解码由`encodeURIComponent`编码的URI组件。

## encodeURIComponent

export function encodeURIComponent(uriComponent: String | Number | Boolean): string

编码URI组件。该函数会编码更多URI语法字符，适合处理路径片段、查询参数值或片段内容。

## escape

export function escape(str: string): string

按旧式规则转义字符串。新代码应优先使用`encodeURI`或`encodeURIComponent`。

## unescape

export function unescape(str: string): string

按旧式规则还原`escape`生成的字符串。新代码应优先使用`decodeURI`或`decodeURIComponent`。

**示例：**

```ets
const raw = "https://example.test/search?q=ArkTS 文档";
const uri = encodeURI(raw);
console.log(uri);
console.log(decodeURI(uri));

const component = encodeURIComponent("ArkTS 文档");
console.log(component);
console.log(decodeURIComponent(component));
```

