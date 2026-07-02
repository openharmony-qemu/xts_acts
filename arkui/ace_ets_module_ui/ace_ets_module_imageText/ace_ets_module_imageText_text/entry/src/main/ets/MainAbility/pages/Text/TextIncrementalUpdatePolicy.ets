/**
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

class TextIncrementalUpdatePolicyModifier implements AttributeModifier<TextAttribute> {
  public incrementalUpdatePolicyValue: IncrementalUpdatePolicy | undefined;

  constructor(value: IncrementalUpdatePolicy | undefined) {
    this.incrementalUpdatePolicyValue = value;
  }

  applyNormalAttribute(instance: TextAttribute): void {
    instance.incrementalUpdatePolicy(this.incrementalUpdatePolicyValue);
  }
}

@Entry
@Component
struct TextIncrementalUpdatePolicy {
  modifierParagraphCache: TextIncrementalUpdatePolicyModifier =
    new TextIncrementalUpdatePolicyModifier(IncrementalUpdatePolicy.PARAGRAPH_CACHE);
  modifierUndefined: TextIncrementalUpdatePolicyModifier =
    new TextIncrementalUpdatePolicyModifier(undefined);

  build() {
    Row() {
      Column() {
        Text('Hello World')
          .width('100%')
          .height('5%')
          .id('text_incrementalUpdatePolicy_default')

        Text('Hello World')
          .width('100%')
          .height('5%')
          .id('text_incrementalUpdatePolicy_NONE')
          .incrementalUpdatePolicy(IncrementalUpdatePolicy.NONE)

        Text('Hello World')
          .width('100%')
          .height('5%')
          .id('text_incrementalUpdatePolicy_PARAGRAPH_CACHE')
          .incrementalUpdatePolicy(IncrementalUpdatePolicy.PARAGRAPH_CACHE)

        Text('Hello World')
          .width('100%')
          .height('5%')
          .id('text_incrementalUpdatePolicy_null')
          .incrementalUpdatePolicy(null)

        Text('Hello World')
          .width('100%')
          .height('5%')
          .id('text_incrementalUpdatePolicy_undefined')
          .incrementalUpdatePolicy(undefined)

        Text('Hello World')
          .width('100%')
          .height('5%')
          .id('text_incrementalUpdatePolicy_modifier_PARAGRAPH_CACHE')
          .attributeModifier(this.modifierParagraphCache)

        Text('Hello World')
          .width('100%')
          .height('5%')
          .id('text_incrementalUpdatePolicy_modifier_UNDEFINED')
          .attributeModifier(this.modifierUndefined)
      }
      .width('100%')
    }
    .height('100%')
  }
}
