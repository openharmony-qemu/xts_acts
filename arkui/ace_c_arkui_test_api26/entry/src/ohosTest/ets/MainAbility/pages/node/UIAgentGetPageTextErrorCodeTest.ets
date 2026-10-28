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

import { AttributeUpdater, CommonModifier } from '@kit.ArkUI';
import nativeFunc from 'libnativerender.so';

@Entry
@Component
struct UIAgentGetPageTextErrorCodeTest {
	private updater: AttributeUpdater<CommonModifier> = new AttributeUpdater<CommonModifier>();
	@State private used: boolean = false;
	@State private result: string = '';

	private run(): void {
		try {
			const uiContext = this.getUIContext();
			this.used = true;
			let failed = -1;
			try {
				// Must set the non-finite translate and collect synchronously in the
				// same UI callback, on a Text that has never been translated before.
				this.updater.attribute?.translate({ x: Number.POSITIVE_INFINITY, y: 0, z: 0 });
				failed = nativeFunc.UIAgentGetPageTextErrorCodeTest002(uiContext);
			} finally {
				this.updater.attribute?.translate({ x: 0, y: 0, z: 0 });
			}
			this.result = `TC2=${failed}`;
		} catch (e) {
			this.result = 'FAIL';
			console.error(`[UIAgentGetPageTextErrorCodeTest] error: ${JSON.stringify(e)}`);
		}
	}

	build() {
		Column({ space: 20 }) {
			Text('PAGE_TEXT_INTERNAL_ERROR_TARGET')
				.id('pageTextInternalErrorTarget')
				.width(300)
				.height(48)
				.attributeModifier(this.updater)

			Button('触发 UIAgentGetPageText 内部错误')
				.id('pageTextInternalErrorTrigger')
				.enabled(!this.used)
				.onClick(() => this.run())

			Text(this.result)
				.id('pageTextInternalErrorResult')
				.fontSize(16)
		}
		.width('100%')
		.height('100%')
		.padding(20)
		.justifyContent(FlexAlign.Center)
	}
}
