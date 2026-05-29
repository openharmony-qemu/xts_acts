# Intl

本模块提供国际化相关类型和格式化类，包括区域匹配、日期时间格式化、数字格式化、复数规则、相对时间格式化和分词能力。

> **说明：**
>
> - 本模块仅适用于ArkTS-Sta。
>
> - 本模块首批接口从API version 20开始支持。后续版本的新增接口，采用上角标单独标记接口的起始版本。

## Intl

export namespace Intl

国际化能力命名空间。

**示例：**

```ets
const locale = Intl.intlLookUpLocale("en-US");
console.log(locale);
```

## 常用类型别名

| 类型 | 说明 |
| :--- | :--- |
| BCP47LanguageTag | BCP 47语言标签字符串。 |
| UnicodeBCP47LocaleIdentifier | Unicode BCP 47区域标识符。 |
| LocalesArgument | 接受单个区域、`Locale`或只读区域数组的参数类型。 |
| LDMLPluralRule | 复数规则结果：`zero`、`one`、`two`、`few`、`many`或`other`。 |
| DateTimeFormatPartTypes | 日期时间格式化片段类型。 |
| NumberFormatPartTypes | 数字格式化片段类型。 |

**示例：**

```ets
const languageTag: Intl.BCP47LanguageTag = "en-US";
const localeId: Intl.UnicodeBCP47LocaleIdentifier = "zh-CN";
const locale = new Intl.Locale("ja-JP");
const locales: Intl.LocalesArgument = [languageTag, locale];
const pluralRule: Intl.LDMLPluralRule = "one";
const datePartType: Intl.DateTimeFormatPartTypes = "year";
const numberPartType: Intl.NumberFormatPartTypes = "integer";

console.log(Intl.intlLocalesToLanguageTags(locales).length);
console.log(localeId);
console.log(pluralRule);
console.log(datePartType);
console.log(numberPartType);
```

### intlLookUpLocale

intlLookUpLocale(locale: Intl.BCP47LanguageTag | Intl.BCP47LanguageTag[]): string

使用lookup策略从候选区域中选择最匹配的区域标签。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| locale | Intl.BCP47LanguageTag \| Intl.BCP47LanguageTag[] | 是 | 单个BCP 47语言标签或语言标签数组。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| string | 匹配到的区域标签。 |

**示例：**

```ets
const locale = Intl.intlLookUpLocale("en-US");
console.log(locale);
```

### intlBestFitLocale

intlBestFitLocale(locale: Intl.BCP47LanguageTag | Intl.BCP47LanguageTag[]): string

使用best fit策略从候选区域中选择最匹配的区域标签。

**示例：**

```ets
const locale = Intl.intlBestFitLocale("en-US");
console.log(locale);
```

### intlLookUpLocales

intlLookUpLocales(locale: Intl.BCP47LanguageTag | Intl.BCP47LanguageTag[]): string[]

使用lookup策略返回匹配到的区域标签列表。

**示例：**

```ets
const locales = Intl.intlLookUpLocales(["en-US", "zh-CN"]);
console.log(locales.length.toString());
```

### intlBestFitLocales

intlBestFitLocales(locale: Intl.BCP47LanguageTag | Intl.BCP47LanguageTag[]): string[]

使用best fit策略返回匹配到的区域标签列表。

**示例：**

```ets
const locales = Intl.intlBestFitLocales(["en-US", "zh-CN"]);
console.log(locales.length.toString());
```

### intlLocalesToLanguageTags

intlLocalesToLanguageTags(locales: string | Intl.Locale | ReadonlyArray<string | Intl.Locale> | undefined): string[]

将区域参数规范化为语言标签数组。传入`undefined`时返回默认区域对应的语言标签数组。

**参数：**

| 参数名 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| locales | string \| Intl.Locale \| ReadonlyArray<string \| Intl.Locale> \| undefined | 是 | 待规范化的区域参数。 |

**返回值：**

| 类型 | 说明 |
| :--- | :--- |
| string[] | 规范化后的语言标签数组。 |

**示例：**

```ets
const tags = Intl.intlLocalesToLanguageTags("en-US");
console.log(tags[0]);
```

## 格式化类

| 类 | 说明 |
| :--- | :--- |
| Collator | 字符串排序和比较。 |
| DateTimeFormat | 日期时间格式化，支持`format`、`formatToParts`、`formatRange`和`resolvedOptions`。 |
| DisplayNames | 语言、地区、脚本、日历、货币等显示名称。 |
| ListFormat | 列表格式化。 |
| Locale | 区域标识及其Unicode扩展选项。 |
| NumberFormat | 数字、货币、百分比和单位格式化。 |
| PluralRules | 复数规则选择。 |
| RelativeTimeFormat | 相对时间格式化。 |
| Segmenter | 文本分词。 |

**示例：**

```ets
const collator = new Intl.Collator("en-US");
console.log(collator.compare("a", "b"));

const dateTime = new Intl.DateTimeFormat("en-US");
console.log(dateTime.format(new Date(0)));

const names = new Intl.DisplayNames("en-US", { type: "language" });
console.log(names.of("zh"));

const list = new Intl.ListFormat("en-US");
console.log(list.format(["red", "green", "blue"]));

const locale = new Intl.Locale("en-US");
console.log(locale);

const numberFormat = new Intl.NumberFormat("en-US");
console.log(numberFormat.format(1234.5));

const plural = new Intl.PluralRules("en-US");
console.log(plural.select(1));

const relativeTime = new Intl.RelativeTimeFormat("en-US");
console.log(relativeTime.format(-1, "day"));

const segmenter = new Intl.Segmenter("en-US", { granularity: "word" });
console.log(segmenter.resolvedOptions().granularity);
```
