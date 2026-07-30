'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import WebScrollbarLayoutPolicyTest from './WebScrollbarLayoutPolicy.test'
import WebScrollDirectionalLockTest from './WebScrollDirectionalLock.test'

export default function testsuite(): void {
  WebScrollbarLayoutPolicyTest();
  WebScrollDirectionalLockTest();
}
