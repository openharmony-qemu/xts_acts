/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

export interface JsProxyObject {
  test: (res: object) => void;
  showString: (res: string) => void;
  register: (res: object) => string;
}

export class ComponentInfo {
  $type: string = '';
  $rect: Object[] = [] as Object[];
}

export class RectInfo {
  left: number;
  top: number;
  right: number;
  bottom: number;
}
