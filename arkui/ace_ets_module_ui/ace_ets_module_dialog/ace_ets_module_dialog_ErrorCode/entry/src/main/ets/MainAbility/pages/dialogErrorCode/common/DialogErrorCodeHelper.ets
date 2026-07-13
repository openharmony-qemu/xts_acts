/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export interface DialogPresenterLike {
  present: (content?: Object, options?: Object) => Promise<Object>;
  update: (content: Object, options?: Object) => Promise<void>;
  dismiss: (target?: Object) => Promise<void>;
}

export function getDialogPresenter(uiContext: UIContext): DialogPresenterLike {
  let ctx: ESObject = uiContext as ESObject;
  return ctx['getDialogPresenter']() as DialogPresenterLike;
}

export function dialogPresent(dialog: DialogPresenterLike, content?: ESObject, options?: ESObject): Promise<Object> {
  return (dialog.present as Function)(content, options) as Promise<Object>;
}

export function dialogUpdate(dialog: DialogPresenterLike, content: ESObject, options?: ESObject): Promise<void> {
  return (dialog.update as Function)(content, options) as Promise<void>;
}

export function dialogDismiss(dialog: DialogPresenterLike, target?: ESObject): Promise<void> {
  return (dialog.dismiss as Function)(target) as Promise<void>;
}
