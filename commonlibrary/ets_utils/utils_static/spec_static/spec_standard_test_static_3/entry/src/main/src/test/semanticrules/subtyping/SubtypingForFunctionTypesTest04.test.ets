/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType
} from '../../../../../hypium/index';

class Base92 {
  b: string = 'b';
}
class Derived92 extends Base92 {
  b: string = 'd';
}
interface I92 {
  fooBB92(p: Base92): Base92;
  fooBD92(p: Base92): Derived92;
  fooDB92(p: Derived92): Base92;
  fooDD92(p: Derived92): Derived92;
  fooBBN92(p: Base92, n: number): Base92;
  fooBDN92(p: Base92, n: number): Derived92;
  fooDBN92(p: Derived92, n: number): Base92;
  fooDDN92(p: Derived92, n: number): Derived92;
  fooBBO92(p: Base92, n?: number): Base92;
  fooBDO92(p: Base92, n?: number): Derived92;
  fooDBO92(p: Derived92, n?: number): Base92;
  fooDDO92(p: Derived92, n?: number): Derived92;
  fooBBR92(p: Base92, ...n: number[]): Base92;
  fooBDR92(p: Base92, ...n: number[]): Derived92;
  fooDBR92(p: Derived92, ...n: number[]): Base92;
  fooDDR92(p: Derived92, ...n: number[]): Derived92;
}
class C92 implements I92 {
  fooBB92(p: Base92): Base92 { return p; }
  fooBD92(p: Base92): Derived92 { return new Derived92(); }
  fooDB92(p: Derived92): Base92 { return new Base92(); }
  fooDD92(p: Derived92): Derived92 { return p; }
  fooBBN92(p: Base92, n: number): Base92 { return p; }
  fooBDN92(p: Base92, n: number): Derived92 { return new Derived92(); }
  fooDBN92(p: Derived92, n: number): Base92 { return new Base92(); }
  fooDDN92(p: Derived92, n: number): Derived92 { return p; }
  fooBBO92(p: Base92, n?: number): Base92 { return p; }
  fooBDO92(p: Base92, n?: number): Derived92 { return new Derived92(); }
  fooDBO92(p: Derived92, n?: number): Base92 { return new Base92(); }
  fooDDO92(p: Derived92, n?: number): Derived92 { return p; }
  fooBBR92(p: Base92, ...n: number[]): Base92 { return p; }
  fooBDR92(p: Base92, ...n: number[]): Derived92 { return new Derived92(); }
  fooDBR92(p: Derived92, ...n: number[]): Base92 { return new Base92(); }
  fooDDR92(p: Derived92, ...n: number[]): Derived92 { return p; }
}
const c92: I92 = new C92();
let foobb92 = c92.fooBB92;
let foobd92 = c92.fooBD92;
let foodb92 = c92.fooDB92;
let foodd92 = c92.fooDD92;
let foobbn92 = c92.fooBBN92;
let foobdn92 = c92.fooBDN92;
let foodbn92 = c92.fooDBN92;
let fooddn92 = c92.fooDDN92;
let foobbo92 = c92.fooBBO92;
let foobdo92 = c92.fooBDO92;
let foodbo92 = c92.fooDBO92;
let fooddo92 = c92.fooDDO92;
let foobbr92 = c92.fooBBR92;
let foobdr92 = c92.fooBDR92;
let foodbr92 = c92.fooDBR92;
let fooddr92 = c92.fooDDR92;
foodbo92 = foobdo92;


class Base93 {
  b: string = 'b';
}
class Derived93 extends Base93 {
  b: string = 'd';
}
interface I93 {
  fooBB93(p: Base93): Base93;
  fooBD93(p: Base93): Derived93;
  fooDB93(p: Derived93): Base93;
  fooDD93(p: Derived93): Derived93;
  fooBBN93(p: Base93, n: number): Base93;
  fooBDN93(p: Base93, n: number): Derived93;
  fooDBN93(p: Derived93, n: number): Base93;
  fooDDN93(p: Derived93, n: number): Derived93;
  fooBBO93(p: Base93, n?: number): Base93;
  fooBDO93(p: Base93, n?: number): Derived93;
  fooDBO93(p: Derived93, n?: number): Base93;
  fooDDO93(p: Derived93, n?: number): Derived93;
  fooBBR93(p: Base93, ...n: number[]): Base93;
  fooBDR93(p: Base93, ...n: number[]): Derived93;
  fooDBR93(p: Derived93, ...n: number[]): Base93;
  fooDDR93(p: Derived93, ...n: number[]): Derived93;
}
class C93 implements I93 {
  fooBB93(p: Base93): Base93 { return p; }
  fooBD93(p: Base93): Derived93 { return new Derived93(); }
  fooDB93(p: Derived93): Base93 { return new Base93(); }
  fooDD93(p: Derived93): Derived93 { return p; }
  fooBBN93(p: Base93, n: number): Base93 { return p; }
  fooBDN93(p: Base93, n: number): Derived93 { return new Derived93(); }
  fooDBN93(p: Derived93, n: number): Base93 { return new Base93(); }
  fooDDN93(p: Derived93, n: number): Derived93 { return p; }
  fooBBO93(p: Base93, n?: number): Base93 { return p; }
  fooBDO93(p: Base93, n?: number): Derived93 { return new Derived93(); }
  fooDBO93(p: Derived93, n?: number): Base93 { return new Base93(); }
  fooDDO93(p: Derived93, n?: number): Derived93 { return p; }
  fooBBR93(p: Base93, ...n: number[]): Base93 { return p; }
  fooBDR93(p: Base93, ...n: number[]): Derived93 { return new Derived93(); }
  fooDBR93(p: Derived93, ...n: number[]): Base93 { return new Base93(); }
  fooDDR93(p: Derived93, ...n: number[]): Derived93 { return p; }
}
const c93: I93 = new C93();
let foobb93 = c93.fooBB93;
let foobd93 = c93.fooBD93;
let foodb93 = c93.fooDB93;
let foodd93 = c93.fooDD93;
let foobbn93 = c93.fooBBN93;
let foobdn93 = c93.fooBDN93;
let foodbn93 = c93.fooDBN93;
let fooddn93 = c93.fooDDN93;
let foobbo93 = c93.fooBBO93;
let foobdo93 = c93.fooBDO93;
let foodbo93 = c93.fooDBO93;
let fooddo93 = c93.fooDDO93;
let foobbr93 = c93.fooBBR93;
let foobdr93 = c93.fooBDR93;
let foodbr93 = c93.fooDBR93;
let fooddr93 = c93.fooDDR93;
foodbr93 = foobdr93;


class Base94 {
  b: string = 'b';
}
class Derived94 extends Base94 {
  b: string = 'd';
}
interface I94 {
  fooBB94(p: Base94): Base94;
  fooBD94(p: Base94): Derived94;
  fooDB94(p: Derived94): Base94;
  fooDD94(p: Derived94): Derived94;
  fooBBN94(p: Base94, n: number): Base94;
  fooBDN94(p: Base94, n: number): Derived94;
  fooDBN94(p: Derived94, n: number): Base94;
  fooDDN94(p: Derived94, n: number): Derived94;
  fooBBO94(p: Base94, n?: number): Base94;
  fooBDO94(p: Base94, n?: number): Derived94;
  fooDBO94(p: Derived94, n?: number): Base94;
  fooDDO94(p: Derived94, n?: number): Derived94;
  fooBBR94(p: Base94, ...n: number[]): Base94;
  fooBDR94(p: Base94, ...n: number[]): Derived94;
  fooDBR94(p: Derived94, ...n: number[]): Base94;
  fooDDR94(p: Derived94, ...n: number[]): Derived94;
}
class C94 implements I94 {
  fooBB94(p: Base94): Base94 { return p; }
  fooBD94(p: Base94): Derived94 { return new Derived94(); }
  fooDB94(p: Derived94): Base94 { return new Base94(); }
  fooDD94(p: Derived94): Derived94 { return p; }
  fooBBN94(p: Base94, n: number): Base94 { return p; }
  fooBDN94(p: Base94, n: number): Derived94 { return new Derived94(); }
  fooDBN94(p: Derived94, n: number): Base94 { return new Base94(); }
  fooDDN94(p: Derived94, n: number): Derived94 { return p; }
  fooBBO94(p: Base94, n?: number): Base94 { return p; }
  fooBDO94(p: Base94, n?: number): Derived94 { return new Derived94(); }
  fooDBO94(p: Derived94, n?: number): Base94 { return new Base94(); }
  fooDDO94(p: Derived94, n?: number): Derived94 { return p; }
  fooBBR94(p: Base94, ...n: number[]): Base94 { return p; }
  fooBDR94(p: Base94, ...n: number[]): Derived94 { return new Derived94(); }
  fooDBR94(p: Derived94, ...n: number[]): Base94 { return new Base94(); }
  fooDDR94(p: Derived94, ...n: number[]): Derived94 { return p; }
}
const c94: I94 = new C94();
let foobb94 = c94.fooBB94;
let foobd94 = c94.fooBD94;
let foodb94 = c94.fooDB94;
let foodd94 = c94.fooDD94;
let foobbn94 = c94.fooBBN94;
let foobdn94 = c94.fooBDN94;
let foodbn94 = c94.fooDBN94;
let fooddn94 = c94.fooDDN94;
let foobbo94 = c94.fooBBO94;
let foobdo94 = c94.fooBDO94;
let foodbo94 = c94.fooDBO94;
let fooddo94 = c94.fooDDO94;
let foobbr94 = c94.fooBBR94;
let foobdr94 = c94.fooBDR94;
let foodbr94 = c94.fooDBR94;
let fooddr94 = c94.fooDDR94;
foodbn94 = foobbn94;


class Base95 {
  b: string = 'b';
}

class Derived95 extends Base95 {
  b: string = 'd';
}

interface I95 {
  fooBB95(p: Base95): Base95;
  fooBD95(p: Base95): Derived95;
  fooDB95(p: Derived95): Base95;
  fooDD95(p: Derived95): Derived95;
  fooBBN95(p: Base95, n: number): Base95;
  fooBDN95(p: Base95, n: number): Derived95;
  fooDBN95(p: Derived95, n: number): Base95;
  fooDDN95(p: Derived95, n: number): Derived95;
  fooBBO95(p: Base95, n?: number): Base95;
  fooBDO95(p: Base95, n?: number): Derived95;
  fooDBO95(p: Derived95, n?: number): Base95;
  fooDDO95(p: Derived95, n?: number): Derived95;
  fooBBR95(p: Base95, ...n: number[]): Base95;
  fooBDR95(p: Base95, ...n: number[]): Derived95;
  fooDBR95(p: Derived95, ...n: number[]): Base95;
  fooDDR95(p: Derived95, ...n: number[]): Derived95;
}

class C95 implements I95 {
  fooBB95(p: Base95): Base95 { return p; }
  fooBD95(p: Base95): Derived95 { return new Derived95(); }
  fooDB95(p: Derived95): Base95 { return new Base95(); }
  fooDD95(p: Derived95): Derived95 { return p; }
  fooBBN95(p: Base95, n: number): Base95 { return p; }
  fooBDN95(p: Base95, n: number): Derived95 { return new Derived95(); }
  fooDBN95(p: Derived95, n: number): Base95 { return new Base95(); }
  fooDDN95(p: Derived95, n: number): Derived95 { return p; }
  fooBBO95(p: Base95, n?: number): Base95 { return p; }
  fooBDO95(p: Base95, n?: number): Derived95 { return new Derived95(); }
  fooDBO95(p: Derived95, n?: number): Base95 { return new Base95(); }
  fooDDO95(p: Derived95, n?: number): Derived95 { return p; }
  fooBBR95(p: Base95, ...n: number[]): Base95 { return p; }
  fooBDR95(p: Base95, ...n: number[]): Derived95 { return new Derived95(); }
  fooDBR95(p: Derived95, ...n: number[]): Base95 { return new Base95(); }
  fooDDR95(p: Derived95, ...n: number[]): Derived95 { return p; }
}

const c95: I95 = new C95();

let foobb95 = c95.fooBB95;
let foobd95 = c95.fooBD95;
let foodb95 = c95.fooDB95;
let foodd95 = c95.fooDD95;
let foobbn95 = c95.fooBBN95;
let foobdn95 = c95.fooBDN95;
let foodbn95 = c95.fooDBN95;
let fooddn95 = c95.fooDDN95;
let foobbo95 = c95.fooBBO95;
let foobdo95 = c95.fooBDO95;
let foodbo95 = c95.fooDBO95;
let fooddo95 = c95.fooDDO95;
let foobbr95 = c95.fooBBR95;
let foobdr95 = c95.fooBDR95;
let foodbr95 = c95.fooDBR95;
let fooddr95 = c95.fooDDR95;

foodbn95 = foobbn95;


class Base96 {
  b: string = 'b';
}
class Derived96 extends Base96 {
  b: string = 'd';
}
interface I96 {
  fooBB96(p: Base96): Base96;
  fooBD96(p: Base96): Derived96;
  fooDB96(p: Derived96): Base96;
  fooDD96(p: Derived96): Derived96;
  fooBBN96(p: Base96, n: number): Base96;
  fooBDN96(p: Base96, n: number): Derived96;
  fooDBN96(p: Derived96, n: number): Base96;
  fooDDN96(p: Derived96, n: number): Derived96;
  fooBBO96(p: Base96, n?: number): Base96;
  fooBDO96(p: Base96, n?: number): Derived96;
  fooDBO96(p: Derived96, n?: number): Base96;
  fooDDO96(p: Derived96, n?: number): Derived96;
  fooBBR96(p: Base96, ...n: number[]): Base96;
  fooBDR96(p: Base96, ...n: number[]): Derived96;
  fooDBR96(p: Derived96, ...n: number[]): Base96;
  fooDDR96(p: Derived96, ...n: number[]): Derived96;
}
class C96 implements I96 {
  fooBB96(p: Base96): Base96 { return p; }
  fooBD96(p: Base96): Derived96 { return new Derived96(); }
  fooDB96(p: Derived96): Base96 { return new Base96(); }
  fooDD96(p: Derived96): Derived96 { return p; }
  fooBBN96(p: Base96, n: number): Base96 { return p; }
  fooBDN96(p: Base96, n: number): Derived96 { return new Derived96(); }
  fooDBN96(p: Derived96, n: number): Base96 { return new Base96(); }
  fooDDN96(p: Derived96, n: number): Derived96 { return p; }
  fooBBO96(p: Base96, n?: number): Base96 { return p; }
  fooBDO96(p: Base96, n?: number): Derived96 { return new Derived96(); }
  fooDBO96(p: Derived96, n?: number): Base96 { return new Base96(); }
  fooDDO96(p: Derived96, n?: number): Derived96 { return p; }
  fooBBR96(p: Base96, ...n: number[]): Base96 { return p; }
  fooBDR96(p: Base96, ...n: number[]): Derived96 { return new Derived96(); }
  fooDBR96(p: Derived96, ...n: number[]): Base96 { return new Base96(); }
  fooDDR96(p: Derived96, ...n: number[]): Derived96 { return p; }
}
const c96: I96 = new C96();
let foobb96 = c96.fooBB96;
let foobd96 = c96.fooBD96;
let foodb96 = c96.fooDB96;
let foodd96 = c96.fooDD96;
let foobbn96 = c96.fooBBN96;
let foobdn96 = c96.fooBDN96;
let foodbn96 = c96.fooDBN96;
let fooddn96 = c96.fooDDN96;
let foobbo96 = c96.fooBBO96;
let foobdo96 = c96.fooBDO96;
let foodbo96 = c96.fooDBO96;
let fooddo96 = c96.fooDDO96;
let foobbr96 = c96.fooBBR96;
let foobdr96 = c96.fooBDR96;
let foodbr96 = c96.fooDBR96;
let fooddr96 = c96.fooDDR96;
foodbr96 = foobbr96;


class Base97 {}
class Derived97 extends Base97 {}
interface I97<T, G extends T> {
  fooBB97(p: T): T;
  fooBD97(p: T): G;
  fooDB97(p: G): T;
  fooDD97(p: G): G;
  fooBBN97(p: T, n: number): T;
  fooBDN97(p: T, n: number): G;
  fooDBN97(p: G, n: number): T;
  fooDDN97(p: G, n: number): G;
  fooBBO97(p: T, n?: number): T;
  fooBDO97(p: T, n?: number): G;
  fooDBO97(p: G, n?: number): T;
  fooDDO97(p: G, n?: number): G;
  fooBBR97(p: T, ...n: number[]): T;
  fooBDR97(p: T, ...n: number[]): G;
  fooDBR97(p: G, ...n: number[]): T;
  fooDDR97(p: G, ...n: number[]): G;
}
class C97<T, G extends T> implements I97<T, G> {
  fooBB97(p: T): T { return p; }
  fooBD97(p: T): G { return p as G; }
  fooDB97(p: G): T { return p as T; }
  fooDD97(p: G): G { return p; }
  fooBBN97(p: T, n: number): T { return p; }
  fooBDN97(p: T, n: number): G { return p as G; }
  fooDBN97(p: G, n: number): T { return p as T; }
  fooDDN97(p: G, n: number): G { return p; }
  fooBBO97(p: T, n?: number): T { return p; }
  fooBDO97(p: T, n?: number): G { return p as G; }
  fooDBO97(p: G, n?: number): T { return p as T; }
  fooDDO97(p: G, n?: number): G { return p; }
  fooBBR97(p: T, ...n: number[]): T { return p; }
  fooBDR97(p: T, ...n: number[]): G { return p as G; }
  fooDBR97(p: G, ...n: number[]): T { return p as T; }
  fooDDR97(p: G, ...n: number[]): G { return p; }
}
let i97: I97<Base97, Derived97> = new C97<Base97, Derived97>();
let foobb97: (p: Base97) => Base97 = i97.fooBB97;
let foobd97: (p: Base97) => Derived97 = i97.fooBD97;
let foodb97: (p: Derived97) => Base97 = i97.fooDB97;
let foodd97: (p: Derived97) => Derived97 = i97.fooDD97;
let foobbn97: (p: Base97, n: number) => Base97 = i97.fooBBN97;
let foobdn97: (p: Base97, n: number) => Derived97 = i97.fooBDN97;
let foodbn97: (p: Derived97, n: number) => Base97 = i97.fooDBN97;
let fooddn97: (p: Derived97, n: number) => Derived97 = i97.fooDDN97;
let foobbo97: (p: Base97, n?: number) => Base97 = i97.fooBBO97;
let foobdo97: (p: Base97, n?: number) => Derived97 = i97.fooBDO97;
let foodbo97: (p: Derived97, n?: number) => Base97 = i97.fooDBO97;
let fooddo97: (p: Derived97, n?: number) => Derived97 = i97.fooDDO97;
let foobbr97: (p: Base97, ...n: number[]) => Base97 = i97.fooBBR97;
let foobdr97: (p: Base97, ...n: number[]) => Derived97 = i97.fooBDR97;
let foodbr97: (p: Derived97, ...n: number[]) => Base97 = i97.fooDBR97;
let fooddr97: (p: Derived97, ...n: number[]) => Derived97 = i97.fooDDR97;
foobb97 = foobd97;


class Base98 {}
class Derived98 extends Base98 {}
interface I98<T, G extends T> {
  fooBB98(p: T): T;
  fooBD98(p: T): G;
  fooDB98(p: G): T;
  fooDD98(p: G): G;
  fooBBN98(p: T, n: number): T;
  fooBDN98(p: T, n: number): G;
  fooDBN98(p: G, n: number): T;
  fooDDN98(p: G, n: number): G;
  fooBBO98(p: T, n?: number): T;
  fooBDO98(p: T, n?: number): G;
  fooDBO98(p: G, n?: number): T;
  fooDDO98(p: G, n?: number): G;
  fooBBR98(p: T, ...n: number[]): T;
  fooBDR98(p: T, ...n: number[]): G;
  fooDBR98(p: G, ...n: number[]): T;
  fooDDR98(p: G, ...n: number[]): G;
}
class C98<T, G extends T> implements I98<T, G> {
  fooBB98(p: T): T { return p; }
  fooBD98(p: T): G { return p as G; }
  fooDB98(p: G): T { return p as T; }
  fooDD98(p: G): G { return p; }
  fooBBN98(p: T, n: number): T { return p; }
  fooBDN98(p: T, n: number): G { return p as G; }
  fooDBN98(p: G, n: number): T { return p as T; }
  fooDDN98(p: G, n: number): G { return p; }
  fooBBO98(p: T, n?: number): T { return p; }
  fooBDO98(p: T, n?: number): G { return p as G; }
  fooDBO98(p: G, n?: number): T { return p as T; }
  fooDDO98(p: G, n?: number): G { return p; }
  fooBBR98(p: T, ...n: number[]): T { return p; }
  fooBDR98(p: T, ...n: number[]): G { return p as G; }
  fooDBR98(p: G, ...n: number[]): T { return p as T; }
  fooDDR98(p: G, ...n: number[]): G { return p; }
}
let i98: I98<Base98, Derived98> = new C98<Base98, Derived98>();
let foobb98: (p: Base98) => Base98 = i98.fooBB98;
let foobd98: (p: Base98) => Derived98 = i98.fooBD98;
let foodb98: (p: Derived98) => Base98 = i98.fooDB98;
let foodd98: (p: Derived98) => Derived98 = i98.fooDD98;
let foobbn98: (p: Base98, n: number) => Base98 = i98.fooBBN98;
let foobdn98: (p: Base98, n: number) => Derived98 = i98.fooBDN98;
let foodbn98: (p: Derived98, n: number) => Base98 = i98.fooDBN98;
let fooddn98: (p: Derived98, n: number) => Derived98 = i98.fooDDN98;
let foobbo98: (p: Base98, n?: number) => Base98 = i98.fooBBO98;
let foobdo98: (p: Base98, n?: number) => Derived98 = i98.fooBDO98;
let foodbo98: (p: Derived98, n?: number) => Base98 = i98.fooDBO98;
let fooddo98: (p: Derived98, n?: number) => Derived98 = i98.fooDDO98;
let foobbr98: (p: Base98, ...n: number[]) => Base98 = i98.fooBBR98;
let foobdr98: (p: Base98, ...n: number[]) => Derived98 = i98.fooBDR98;
let foodbr98: (p: Derived98, ...n: number[]) => Base98 = i98.fooDBR98;
let fooddr98: (p: Derived98, ...n: number[]) => Derived98 = i98.fooDDR98;
foodb98 = foobd98;


class Base99 {}
class Derived99 extends Base99 {}
interface I99<T, G extends T> {
  fooBB99(p: T): T;
  fooBD99(p: T): G;
  fooDB99(p: G): T;
  fooDD99(p: G): G;
  fooBBN99(p: T, n: number): T;
  fooBDN99(p: T, n: number): G;
  fooDBN99(p: G, n: number): T;
  fooDDN99(p: G, n: number): G;
  fooBBO99(p: T, n?: number): T;
  fooBDO99(p: T, n?: number): G;
  fooDBO99(p: G, n?: number): T;
  fooDDO99(p: G, n?: number): G;
  fooBBR99(p: T, ...n: number[]): T;
  fooBDR99(p: T, ...n: number[]): G;
  fooDBR99(p: G, ...n: number[]): T;
  fooDDR99(p: G, ...n: number[]): G;
}
class C99<T, G extends T> implements I99<T, G> {
  fooBB99(p: T): T { return p; }
  fooBD99(p: T): G { return p as G; }
  fooDB99(p: G): T { return p as T; }
  fooDD99(p: G): G { return p; }
  fooBBN99(p: T, n: number): T { return p; }
  fooBDN99(p: T, n: number): G { return p as G; }
  fooDBN99(p: G, n: number): T { return p as T; }
  fooDDN99(p: G, n: number): G { return p; }
  fooBBO99(p: T, n?: number): T { return p; }
  fooBDO99(p: T, n?: number): G { return p as G; }
  fooDBO99(p: G, n?: number): T { return p as T; }
  fooDDO99(p: G, n?: number): G { return p; }
  fooBBR99(p: T, ...n: number[]): T { return p; }
  fooBDR99(p: T, ...n: number[]): G { return p as G; }
  fooDBR99(p: G, ...n: number[]): T { return p as T; }
  fooDDR99(p: G, ...n: number[]): G { return p; }
}
let i99: I99<Base99, Derived99> = new C99<Base99, Derived99>();
let foobb99: (p: Base99) => Base99 = i99.fooBB99;
let foobd99: (p: Base99) => Derived99 = i99.fooBD99;
let foodb99: (p: Derived99) => Base99 = i99.fooDB99;
let foodd99: (p: Derived99) => Derived99 = i99.fooDD99;
let foobbn99: (p: Base99, n: number) => Base99 = i99.fooBBN99;
let foobdn99: (p: Base99, n: number) => Derived99 = i99.fooBDN99;
let foodbn99: (p: Derived99, n: number) => Base99 = i99.fooDBN99;
let fooddn99: (p: Derived99, n: number) => Derived99 = i99.fooDDN99;
let foobbo99: (p: Base99, n?: number) => Base99 = i99.fooBBO99;
let foobdo99: (p: Base99, n?: number) => Derived99 = i99.fooBDO99;
let foodbo99: (p: Derived99, n?: number) => Base99 = i99.fooDBO99;
let fooddo99: (p: Derived99, n?: number) => Derived99 = i99.fooDDO99;
let foobbr99: (p: Base99, ...n: number[]) => Base99 = i99.fooBBR99;
let foobdr99: (p: Base99, ...n: number[]) => Derived99 = i99.fooBDR99;
let foodbr99: (p: Derived99, ...n: number[]) => Base99 = i99.fooDBR99;
let fooddr99: (p: Derived99, ...n: number[]) => Derived99 = i99.fooDDR99;
foodd99 = foobd99;


class Base100 {}
class Derived100 extends Base100 {}
interface I100<T, G extends T> {
  fooBB100(p: T): T;
  fooBD100(p: T): G;
  fooDB100(p: G): T;
  fooDD100(p: G): G;
  fooBBN100(p: T, n: number): T;
  fooBDN100(p: T, n: number): G;
  fooDBN100(p: G, n: number): T;
  fooDDN100(p: G, n: number): G;
  fooBBO100(p: T, n?: number): T;
  fooBDO100(p: T, n?: number): G;
  fooDBO100(p: G, n?: number): T;
  fooDDO100(p: G, n?: number): G;
  fooBBR100(p: T, ...n: number[]): T;
  fooBDR100(p: T, ...n: number[]): G;
  fooDBR100(p: G, ...n: number[]): T;
  fooDDR100(p: G, ...n: number[]): G;
}
class C100<T, G extends T> implements I100<T, G> {
  fooBB100(p: T): T { return p; }
  fooBD100(p: T): G { return p as G; }
  fooDB100(p: G): T { return p as T; }
  fooDD100(p: G): G { return p; }
  fooBBN100(p: T, n: number): T { return p; }
  fooBDN100(p: T, n: number): G { return p as G; }
  fooDBN100(p: G, n: number): T { return p as T; }
  fooDDN100(p: G, n: number): G { return p; }
  fooBBO100(p: T, n?: number): T { return p; }
  fooBDO100(p: T, n?: number): G { return p as G; }
  fooDBO100(p: G, n?: number): T { return p as T; }
  fooDDO100(p: G, n?: number): G { return p; }
  fooBBR100(p: T, ...n: number[]): T { return p; }
  fooBDR100(p: T, ...n: number[]): G { return p as G; }
  fooDBR100(p: G, ...n: number[]): T { return p as T; }
  fooDDR100(p: G, ...n: number[]): G { return p; }
}
let i100: I100<Base100, Derived100> = new C100<Base100, Derived100>();
let foobb100: (p: Base100) => Base100 = i100.fooBB100;
let foobd100: (p: Base100) => Derived100 = i100.fooBD100;
let foodb100: (p: Derived100) => Base100 = i100.fooDB100;
let foodd100: (p: Derived100) => Derived100 = i100.fooDD100;
let foobbn100: (p: Base100, n: number) => Base100 = i100.fooBBN100;
let foobdn100: (p: Base100, n: number) => Derived100 = i100.fooBDN100;
let foodbn100: (p: Derived100, n: number) => Base100 = i100.fooDBN100;
let fooddn100: (p: Derived100, n: number) => Derived100 = i100.fooDDN100;
let foobbo100: (p: Base100, n?: number) => Base100 = i100.fooBBO100;
let foobdo100: (p: Base100, n?: number) => Derived100 = i100.fooBDO100;
let foodbo100: (p: Derived100, n?: number) => Base100 = i100.fooDBO100;
let fooddo100: (p: Derived100, n?: number) => Derived100 = i100.fooDDO100;
let foobbr100: (p: Base100, ...n: number[]) => Base100 = i100.fooBBR100;
let foobdr100: (p: Base100, ...n: number[]) => Derived100 = i100.fooBDR100;
let foodbr100: (p: Derived100, ...n: number[]) => Base100 = i100.fooDBR100;
let fooddr100: (p: Derived100, ...n: number[]) => Derived100 = i100.fooDDR100;
foodd100 = foobd100;


class Base101 {}
class Derived101 extends Base101 {}
interface I101<T, G extends T> {
  fooBB101(p: T): T;
  fooBD101(p: T): G;
  fooDB101(p: G): T;
  fooDD101(p: G): G;
  fooBBN101(p: T, n: number): T;
  fooBDN101(p: T, n: number): G;
  fooDBN101(p: G, n: number): T;
  fooDDN101(p: G, n: number): G;
  fooBBO101(p: T, n?: number): T;
  fooBDO101(p: T, n?: number): G;
  fooDBO101(p: G, n?: number): T;
  fooDDO101(p: G, n?: number): G;
  fooBBR101(p: T, ...n: number[]): T;
  fooBDR101(p: T, ...n: number[]): G;
  fooDBR101(p: G, ...n: number[]): T;
  fooDDR101(p: G, ...n: number[]): G;
}
class C101<T, G extends T> implements I101<T, G> {
  fooBB101(p: T): T { return p; }
  fooBD101(p: T): G { return p as G; }
  fooDB101(p: G): T { return p as T; }
  fooDD101(p: G): G { return p; }
  fooBBN101(p: T, n: number): T { return p; }
  fooBDN101(p: T, n: number): G { return p as G; }
  fooDBN101(p: G, n: number): T { return p as T; }
  fooDDN101(p: G, n: number): G { return p; }
  fooBBO101(p: T, n?: number): T { return p; }
  fooBDO101(p: T, n?: number): G { return p as G; }
  fooDBO101(p: G, n?: number): T { return p as T; }
  fooDDO101(p: G, n?: number): G { return p; }
  fooBBR101(p: T, ...n: number[]): T { return p; }
  fooBDR101(p: T, ...n: number[]): G { return p as G; }
  fooDBR101(p: G, ...n: number[]): T { return p as T; }
  fooDDR101(p: G, ...n: number[]): G { return p; }
}
let i101: I101<Base101, Derived101> = new C101<Base101, Derived101>();
let foobb101: (p: Base101) => Base101 = i101.fooBB101;
let foobd101: (p: Base101) => Derived101 = i101.fooBD101;
let foodb101: (p: Derived101) => Base101 = i101.fooDB101;
let foodd101: (p: Derived101) => Derived101 = i101.fooDD101;
let foobbn101: (p: Base101, n: number) => Base101 = i101.fooBBN101;
let foobdn101: (p: Base101, n: number) => Derived101 = i101.fooBDN101;
let foodbn101: (p: Derived101, n: number) => Base101 = i101.fooDBN101;
let fooddn101: (p: Derived101, n: number) => Derived101 = i101.fooDDN101;
let foobbo101: (p: Base101, n?: number) => Base101 = i101.fooBBO101;
let foobdo101: (p: Base101, n?: number) => Derived101 = i101.fooBDO101;
let foodbo101: (p: Derived101, n?: number) => Base101 = i101.fooDBO101;
let fooddo101: (p: Derived101, n?: number) => Derived101 = i101.fooDDO101;
let foobbr101: (p: Base101, ...n: number[]) => Base101 = i101.fooBBR101;
let foobdr101: (p: Base101, ...n: number[]) => Derived101 = i101.fooBDR101;
let foodbr101: (p: Derived101, ...n: number[]) => Base101 = i101.fooDBR101;
let fooddr101: (p: Derived101, ...n: number[]) => Derived101 = i101.fooDDR101;
foobbn101 = foobb101;


class Base102 {}
class Derived102 extends Base102 {}
interface I102<T, G extends T> {
  fooBB102(p: T): T;
  fooBD102(p: T): G;
  fooDB102(p: G): T;
  fooDD102(p: G): G;
  fooBBN102(p: T, n: number): T;
  fooBDN102(p: T, n: number): G;
  fooDBN102(p: G, n: number): T;
  fooDDN102(p: G, n: number): G;
  fooBBO102(p: T, n?: number): T;
  fooBDO102(p: T, n?: number): G;
  fooDBO102(p: G, n?: number): T;
  fooDDO102(p: G, n?: number): G;
  fooBBR102(p: T, ...n: number[]): T;
  fooBDR102(p: T, ...n: number[]): G;
  fooDBR102(p: G, ...n: number[]): T;
  fooDDR102(p: G, ...n: number[]): G;
}
class C102<T, G extends T> implements I102<T, G> {
  fooBB102(p: T): T { return p; }
  fooBD102(p: T): G { return p as G; }
  fooDB102(p: G): T { return p as T; }
  fooDD102(p: G): G { return p; }
  fooBBN102(p: T, n: number): T { return p; }
  fooBDN102(p: T, n: number): G { return p as G; }
  fooDBN102(p: G, n: number): T { return p as T; }
  fooDDN102(p: G, n: number): G { return p; }
  fooBBO102(p: T, n?: number): T { return p; }
  fooBDO102(p: T, n?: number): G { return p as G; }
  fooDBO102(p: G, n?: number): T { return p as T; }
  fooDDO102(p: G, n?: number): G { return p; }
  fooBBR102(p: T, ...n: number[]): T { return p; }
  fooBDR102(p: T, ...n: number[]): G { return p as G; }
  fooDBR102(p: G, ...n: number[]): T { return p as T; }
  fooDDR102(p: G, ...n: number[]): G { return p; }
}
let i102: I102<Base102, Derived102> = new C102<Base102, Derived102>();
let foobb102: (p: Base102) => Base102 = i102.fooBB102;
let foobd102: (p: Base102) => Derived102 = i102.fooBD102;
let foodb102: (p: Derived102) => Base102 = i102.fooDB102;
let foodd102: (p: Derived102) => Derived102 = i102.fooDD102;
let foobbn102: (p: Base102, n: number) => Base102 = i102.fooBBN102;
let foobdn102: (p: Base102, n: number) => Derived102 = i102.fooBDN102;
let foodbn102: (p: Derived102, n: number) => Base102 = i102.fooDBN102;
let fooddn102: (p: Derived102, n: number) => Derived102 = i102.fooDDN102;
let foobbo102: (p: Base102, n?: number) => Base102 = i102.fooBBO102;
let foobdo102: (p: Base102, n?: number) => Derived102 = i102.fooBDO102;
let foodbo102: (p: Derived102, n?: number) => Base102 = i102.fooDBO102;
let fooddo102: (p: Derived102, n?: number) => Derived102 = i102.fooDDO102;
let foobbr102: (p: Base102, ...n: number[]) => Base102 = i102.fooBBR102;
let foobdr102: (p: Base102, ...n: number[]) => Derived102 = i102.fooBDR102;
let foodbr102: (p: Derived102, ...n: number[]) => Base102 = i102.fooDBR102;
let fooddr102: (p: Derived102, ...n: number[]) => Derived102 = i102.fooDDR102;
foobbo102 = foobb102;


class Base103 {}
class Derived103 extends Base103 {}
interface I103<T, G extends T> {
  fooBB103(p: T): T;
  fooBD103(p: T): G;
  fooDB103(p: G): T;
  fooDD103(p: G): G;
  fooBBN103(p: T, n: number): T;
  fooBDN103(p: T, n: number): G;
  fooDBN103(p: G, n: number): T;
  fooDDN103(p: G, n: number): G;
  fooBBO103(p: T, n?: number): T;
  fooBDO103(p: T, n?: number): G;
  fooDBO103(p: G, n?: number): T;
  fooDDO103(p: G, n?: number): G;
  fooBBR103(p: T, ...n: number[]): T;
  fooBDR103(p: T, ...n: number[]): G;
  fooDBR103(p: G, ...n: number[]): T;
  fooDDR103(p: G, ...n: number[]): G;
}
class C103<T, G extends T> implements I103<T, G> {
  fooBB103(p: T): T { return p; }
  fooBD103(p: T): G { return p as G; }
  fooDB103(p: G): T { return p as T; }
  fooDD103(p: G): G { return p; }
  fooBBN103(p: T, n: number): T { return p; }
  fooBDN103(p: T, n: number): G { return p as G; }
  fooDBN103(p: G, n: number): T { return p as T; }
  fooDDN103(p: G, n: number): G { return p; }
  fooBBO103(p: T, n?: number): T { return p; }
  fooBDO103(p: T, n?: number): G { return p as G; }
  fooDBO103(p: G, n?: number): T { return p as T; }
  fooDDO103(p: G, n?: number): G { return p; }
  fooBBR103(p: T, ...n: number[]): T { return p; }
  fooBDR103(p: T, ...n: number[]): G { return p as G; }
  fooDBR103(p: G, ...n: number[]): T { return p as T; }
  fooDDR103(p: G, ...n: number[]): G { return p; }
}
let i103: I103<Base103, Derived103> = new C103<Base103, Derived103>();
let foobb103: (p: Base103) => Base103 = i103.fooBB103;
let foobd103: (p: Base103) => Derived103 = i103.fooBD103;
let foodb103: (p: Derived103) => Base103 = i103.fooDB103;
let foodd103: (p: Derived103) => Derived103 = i103.fooDD103;
let foobbn103: (p: Base103, n: number) => Base103 = i103.fooBBN103;
let foobdn103: (p: Base103, n: number) => Derived103 = i103.fooBDN103;
let foodbn103: (p: Derived103, n: number) => Base103 = i103.fooDBN103;
let fooddn103: (p: Derived103, n: number) => Derived103 = i103.fooDDN103;
let foobbo103: (p: Base103, n?: number) => Base103 = i103.fooBBO103;
let foobdo103: (p: Base103, n?: number) => Derived103 = i103.fooBDO103;
let foodbo103: (p: Derived103, n?: number) => Base103 = i103.fooDBO103;
let fooddo103: (p: Derived103, n?: number) => Derived103 = i103.fooDDO103;
let foobbr103: (p: Base103, ...n: number[]) => Base103 = i103.fooBBR103;
let foobdr103: (p: Base103, ...n: number[]) => Derived103 = i103.fooBDR103;
let foodbr103: (p: Derived103, ...n: number[]) => Base103 = i103.fooDBR103;
let fooddr103: (p: Derived103, ...n: number[]) => Derived103 = i103.fooDDR103;
foobbn103 = foobd103;


class Base104 {}
class Derived104 extends Base104 {}
interface I104<T, G extends T> {
  fooBB104(p: T): T;
  fooBD104(p: T): G;
  fooDB104(p: G): T;
  fooDD104(p: G): G;
  fooBBN104(p: T, n: number): T;
  fooBDN104(p: T, n: number): G;
  fooDBN104(p: G, n: number): T;
  fooDDN104(p: G, n: number): G;
  fooBBO104(p: T, n?: number): T;
  fooBDO104(p: T, n?: number): G;
  fooDBO104(p: G, n?: number): T;
  fooDDO104(p: G, n?: number): G;
  fooBBR104(p: T, ...n: number[]): T;
  fooBDR104(p: T, ...n: number[]): G;
  fooDBR104(p: G, ...n: number[]): T;
  fooDDR104(p: G, ...n: number[]): G;
}
class C104<T, G extends T> implements I104<T, G> {
  fooBB104(p: T): T { return p; }
  fooBD104(p: T): G { return p as G; }
  fooDB104(p: G): T { return p as T; }
  fooDD104(p: G): G { return p; }
  fooBBN104(p: T, n: number): T { return p; }
  fooBDN104(p: T, n: number): G { return p as G; }
  fooDBN104(p: G, n: number): T { return p as T; }
  fooDDN104(p: G, n: number): G { return p; }
  fooBBO104(p: T, n?: number): T { return p; }
  fooBDO104(p: T, n?: number): G { return p as G; }
  fooDBO104(p: G, n?: number): T { return p as T; }
  fooDDO104(p: G, n?: number): G { return p; }
  fooBBR104(p: T, ...n: number[]): T { return p; }
  fooBDR104(p: T, ...n: number[]): G { return p as G; }
  fooDBR104(p: G, ...n: number[]): T { return p as T; }
  fooDDR104(p: G, ...n: number[]): G { return p; }
}
let i104: I104<Base104, Derived104> = new C104<Base104, Derived104>();
let foobb104: (p: Base104) => Base104 = i104.fooBB104;
let foobd104: (p: Base104) => Derived104 = i104.fooBD104;
let foodb104: (p: Derived104) => Base104 = i104.fooDB104;
let foodd104: (p: Derived104) => Derived104 = i104.fooDD104;
let foobbn104: (p: Base104, n: number) => Base104 = i104.fooBBN104;
let foobdn104: (p: Base104, n: number) => Derived104 = i104.fooBDN104;
let foodbn104: (p: Derived104, n: number) => Base104 = i104.fooDBN104;
let fooddn104: (p: Derived104, n: number) => Derived104 = i104.fooDDN104;
let foobbo104: (p: Base104, n?: number) => Base104 = i104.fooBBO104;
let foobdo104: (p: Base104, n?: number) => Derived104 = i104.fooBDO104;
let foodbo104: (p: Derived104, n?: number) => Base104 = i104.fooDBO104;
let fooddo104: (p: Derived104, n?: number) => Derived104 = i104.fooDDO104;
let foobbr104: (p: Base104, ...n: number[]) => Base104 = i104.fooBBR104;
let foobdr104: (p: Base104, ...n: number[]) => Derived104 = i104.fooBDR104;
let foodbr104: (p: Derived104, ...n: number[]) => Base104 = i104.fooDBR104;
let fooddr104: (p: Derived104, ...n: number[]) => Derived104 = i104.fooDDR104;
foobbo104 = foobd104;


class Base105 {}
class Derived105 extends Base105 {}
interface I105<T, G extends T> {
  fooBB105(p: T): T;
  fooBD105(p: T): G;
  fooDB105(p: G): T;
  fooDD105(p: G): G;
  fooBBN105(p: T, n: number): T;
  fooBDN105(p: T, n: number): G;
  fooDBN105(p: G, n: number): T;
  fooDDN105(p: G, n: number): G;
  fooBBO105(p: T, n?: number): T;
  fooBDO105(p: T, n?: number): G;
  fooDBO105(p: G, n?: number): T;
  fooDDO105(p: G, n?: number): G;
  fooBBR105(p: T, ...n: number[]): T;
  fooBDR105(p: T, ...n: number[]): G;
  fooDBR105(p: G, ...n: number[]): T;
  fooDDR105(p: G, ...n: number[]): G;
}
class C105<T, G extends T> implements I105<T, G> {
  fooBB105(p: T): T { return p; }
  fooBD105(p: T): G { return p as G; }
  fooDB105(p: G): T { return p as T; }
  fooDD105(p: G): G { return p; }
  fooBBN105(p: T, n: number): T { return p; }
  fooBDN105(p: T, n: number): G { return p as G; }
  fooDBN105(p: G, n: number): T { return p as T; }
  fooDDN105(p: G, n: number): G { return p; }
  fooBBO105(p: T, n?: number): T { return p; }
  fooBDO105(p: T, n?: number): G { return p as G; }
  fooDBO105(p: G, n?: number): T { return p as T; }
  fooDDO105(p: G, n?: number): G { return p; }
  fooBBR105(p: T, ...n: number[]): T { return p; }
  fooBDR105(p: T, ...n: number[]): G { return p as G; }
  fooDBR105(p: G, ...n: number[]): T { return p as T; }
  fooDDR105(p: G, ...n: number[]): G { return p; }
}
let i105: I105<Base105, Derived105> = new C105<Base105, Derived105>();
let foobb105: (p: Base105) => Base105 = i105.fooBB105;
let foobd105: (p: Base105) => Derived105 = i105.fooBD105;
let foodb105: (p: Derived105) => Base105 = i105.fooDB105;
let foodd105: (p: Derived105) => Derived105 = i105.fooDD105;
let foobbn105: (p: Base105, n: number) => Base105 = i105.fooBBN105;
let foobdn105: (p: Base105, n: number) => Derived105 = i105.fooBDN105;
let foodbn105: (p: Derived105, n: number) => Base105 = i105.fooDBN105;
let fooddn105: (p: Derived105, n: number) => Derived105 = i105.fooDDN105;
let foobbo105: (p: Base105, n?: number) => Base105 = i105.fooBBO105;
let foobdo105: (p: Base105, n?: number) => Derived105 = i105.fooBDO105;
let foodbo105: (p: Derived105, n?: number) => Base105 = i105.fooDBO105;
let fooddo105: (p: Derived105, n?: number) => Derived105 = i105.fooDDO105;
let foobbr105: (p: Base105, ...n: number[]) => Base105 = i105.fooBBR105;
let foobdr105: (p: Base105, ...n: number[]) => Derived105 = i105.fooBDR105;
let foodbr105: (p: Derived105, ...n: number[]) => Base105 = i105.fooDBR105;
let fooddr105: (p: Derived105, ...n: number[]) => Derived105 = i105.fooDDR105;
foodbn105 = foobd105;


class Base106 {}
class Derived106 extends Base106 {}
interface I106<T, G extends T> {
  fooBB106(p: T): T;
  fooBD106(p: T): G;
  fooDB106(p: G): T;
  fooDD106(p: G): G;
  fooBBN106(p: T, n: number): T;
  fooBDN106(p: T, n: number): G;
  fooDBN106(p: G, n: number): T;
  fooDDN106(p: G, n: number): G;
  fooBBO106(p: T, n?: number): T;
  fooBDO106(p: T, n?: number): G;
  fooDBO106(p: G, n?: number): T;
  fooDDO106(p: G, n?: number): G;
  fooBBR106(p: T, ...n: number[]): T;
  fooBDR106(p: T, ...n: number[]): G;
  fooDBR106(p: G, ...n: number[]): T;
  fooDDR106(p: G, ...n: number[]): G;
}
class C106<T, G extends T> implements I106<T, G> {
  fooBB106(p: T): T { return p; }
  fooBD106(p: T): G { return p as G; }
  fooDB106(p: G): T { return p as T; }
  fooDD106(p: G): G { return p; }
  fooBBN106(p: T, n: number): T { return p; }
  fooBDN106(p: T, n: number): G { return p as G; }
  fooDBN106(p: G, n: number): T { return p as T; }
  fooDDN106(p: G, n: number): G { return p; }
  fooBBO106(p: T, n?: number): T { return p; }
  fooBDO106(p: T, n?: number): G { return p as G; }
  fooDBO106(p: G, n?: number): T { return p as T; }
  fooDDO106(p: G, n?: number): G { return p; }
  fooBBR106(p: T, ...n: number[]): T { return p; }
  fooBDR106(p: T, ...n: number[]): G { return p as G; }
  fooDBR106(p: G, ...n: number[]): T { return p as T; }
  fooDDR106(p: G, ...n: number[]): G { return p; }
}
let i106: I106<Base106, Derived106> = new C106<Base106, Derived106>();
let foobb106: (p: Base106) => Base106 = i106.fooBB106;
let foobd106: (p: Base106) => Derived106 = i106.fooBD106;
let foodb106: (p: Derived106) => Base106 = i106.fooDB106;
let foodd106: (p: Derived106) => Derived106 = i106.fooDD106;
let foobbn106: (p: Base106, n: number) => Base106 = i106.fooBBN106;
let foobdn106: (p: Base106, n: number) => Derived106 = i106.fooBDN106;
let foodbn106: (p: Derived106, n: number) => Base106 = i106.fooDBN106;
let fooddn106: (p: Derived106, n: number) => Derived106 = i106.fooDDN106;
let foobbo106: (p: Base106, n?: number) => Base106 = i106.fooBBO106;
let foobdo106: (p: Base106, n?: number) => Derived106 = i106.fooBDO106;
let foodbo106: (p: Derived106, n?: number) => Base106 = i106.fooDBO106;
let fooddo106: (p: Derived106, n?: number) => Derived106 = i106.fooDDO106;
let foobbr106: (p: Base106, ...n: number[]) => Base106 = i106.fooBBR106;
let foobdr106: (p: Base106, ...n: number[]) => Derived106 = i106.fooBDR106;
let foodbr106: (p: Derived106, ...n: number[]) => Base106 = i106.fooDBR106;
let fooddr106: (p: Derived106, ...n: number[]) => Derived106 = i106.fooDDR106;
foodbo106 = foobd106;


class Base107 {}
class Derived107 extends Base107 {}
interface I107<T, G extends T> {
  fooBB107(p: T): T;
  fooBD107(p: T): G;
  fooDB107(p: G): T;
  fooDD107(p: G): G;
  fooBBN107(p: T, n: number): T;
  fooBDN107(p: T, n: number): G;
  fooDBN107(p: G, n: number): T;
  fooDDN107(p: G, n: number): G;
  fooBBO107(p: T, n?: number): T;
  fooBDO107(p: T, n?: number): G;
  fooDBO107(p: G, n?: number): T;
  fooDDO107(p: G, n?: number): G;
  fooBBR107(p: T, ...n: number[]): T;
  fooBDR107(p: T, ...n: number[]): G;
  fooDBR107(p: G, ...n: number[]): T;
  fooDDR107(p: G, ...n: number[]): G;
}
class C107<T, G extends T> implements I107<T, G> {
  fooBB107(p: T): T { return p; }
  fooBD107(p: T): G { return p as G; }
  fooDB107(p: G): T { return p as T; }
  fooDD107(p: G): G { return p; }
  fooBBN107(p: T, n: number): T { return p; }
  fooBDN107(p: T, n: number): G { return p as G; }
  fooDBN107(p: G, n: number): T { return p as T; }
  fooDDN107(p: G, n: number): G { return p; }
  fooBBO107(p: T, n?: number): T { return p; }
  fooBDO107(p: T, n?: number): G { return p as G; }
  fooDBO107(p: G, n?: number): T { return p as T; }
  fooDDO107(p: G, n?: number): G { return p; }
  fooBBR107(p: T, ...n: number[]): T { return p; }
  fooBDR107(p: T, ...n: number[]): G { return p as G; }
  fooDBR107(p: G, ...n: number[]): T { return p as T; }
  fooDDR107(p: G, ...n: number[]): G { return p; }
}
let i107: I107<Base107, Derived107> = new C107<Base107, Derived107>();
let foobb107: (p: Base107) => Base107 = i107.fooBB107;
let foobd107: (p: Base107) => Derived107 = i107.fooBD107;
let foodb107: (p: Derived107) => Base107 = i107.fooDB107;
let foodd107: (p: Derived107) => Derived107 = i107.fooDD107;
let foobbn107: (p: Base107, n: number) => Base107 = i107.fooBBN107;
let foobdn107: (p: Base107, n: number) => Derived107 = i107.fooBDN107;
let foodbn107: (p: Derived107, n: number) => Base107 = i107.fooDBN107;
let fooddn107: (p: Derived107, n: number) => Derived107 = i107.fooDDN107;
let foobbo107: (p: Base107, n?: number) => Base107 = i107.fooBBO107;
let foobdo107: (p: Base107, n?: number) => Derived107 = i107.fooBDO107;
let foodbo107: (p: Derived107, n?: number) => Base107 = i107.fooDBO107;
let fooddo107: (p: Derived107, n?: number) => Derived107 = i107.fooDDO107;
let foobbr107: (p: Base107, ...n: number[]) => Base107 = i107.fooBBR107;
let foobdr107: (p: Base107, ...n: number[]) => Derived107 = i107.fooBDR107;
let foodbr107: (p: Derived107, ...n: number[]) => Base107 = i107.fooDBR107;
let fooddr107: (p: Derived107, ...n: number[]) => Derived107 = i107.fooDDR107;
foodbn107 = fooddn107;


class Base108 {}
class Derived108 extends Base108 {}
interface I108<T, G extends T> {
  fooBB108(p: T): T;
  fooBD108(p: T): G;
  fooDB108(p: G): T;
  fooDD108(p: G): G;
  fooBBN108(p: T, n: number): T;
  fooBDN108(p: T, n: number): G;
  fooDBN108(p: G, n: number): T;
  fooDDN108(p: G, n: number): G;
  fooBBO108(p: T, n?: number): T;
  fooBDO108(p: T, n?: number): G;
  fooDBO108(p: G, n?: number): T;
  fooDDO108(p: G, n?: number): G;
  fooBBR108(p: T, ...n: number[]): T;
  fooBDR108(p: T, ...n: number[]): G;
  fooDBR108(p: G, ...n: number[]): T;
  fooDDR108(p: G, ...n: number[]): G;
}
class C108<T, G extends T> implements I108<T, G> {
  fooBB108(p: T): T { return p; }
  fooBD108(p: T): G { return p as G; }
  fooDB108(p: G): T { return p as T; }
  fooDD108(p: G): G { return p; }
  fooBBN108(p: T, n: number): T { return p; }
  fooBDN108(p: T, n: number): G { return p as G; }
  fooDBN108(p: G, n: number): T { return p as T; }
  fooDDN108(p: G, n: number): G { return p; }
  fooBBO108(p: T, n?: number): T { return p; }
  fooBDO108(p: T, n?: number): G { return p as G; }
  fooDBO108(p: G, n?: number): T { return p as T; }
  fooDDO108(p: G, n?: number): G { return p; }
  fooBBR108(p: T, ...n: number[]): T { return p; }
  fooBDR108(p: T, ...n: number[]): G { return p as G; }
  fooDBR108(p: G, ...n: number[]): T { return p as T; }
  fooDDR108(p: G, ...n: number[]): G { return p; }
}
let i108: I108<Base108, Derived108> = new C108<Base108, Derived108>();
let foobb108: (p: Base108) => Base108 = i108.fooBB108;
let foobd108: (p: Base108) => Derived108 = i108.fooBD108;
let foodb108: (p: Derived108) => Base108 = i108.fooDB108;
let foodd108: (p: Derived108) => Derived108 = i108.fooDD108;
let foobbn108: (p: Base108, n: number) => Base108 = i108.fooBBN108;
let foobdn108: (p: Base108, n: number) => Derived108 = i108.fooBDN108;
let foodbn108: (p: Derived108, n: number) => Base108 = i108.fooDBN108;
let fooddn108: (p: Derived108, n: number) => Derived108 = i108.fooDDN108;
let foobbo108: (p: Base108, n?: number) => Base108 = i108.fooBBO108;
let foobdo108: (p: Base108, n?: number) => Derived108 = i108.fooBDO108;
let foodbo108: (p: Derived108, n?: number) => Base108 = i108.fooDBO108;
let fooddo108: (p: Derived108, n?: number) => Derived108 = i108.fooDDO108;
let foobbr108: (p: Base108, ...n: number[]) => Base108 = i108.fooBBR108;
let foobdr108: (p: Base108, ...n: number[]) => Derived108 = i108.fooBDR108;
let foodbr108: (p: Derived108, ...n: number[]) => Base108 = i108.fooDBR108;
let fooddr108: (p: Derived108, ...n: number[]) => Derived108 = i108.fooDDR108;
foodbo108 = fooddo108;


class Base109 {}
class Derived109 extends Base109 {}
interface I109<T, G extends T> {
  fooBB109(p: T): T;
  fooBD109(p: T): G;
  fooDB109(p: G): T;
  fooDD109(p: G): G;
  fooBBN109(p: T, n: number): T;
  fooBDN109(p: T, n: number): G;
  fooDBN109(p: G, n: number): T;
  fooDDN109(p: G, n: number): G;
  fooBBO109(p: T, n?: number): T;
  fooBDO109(p: T, n?: number): G;
  fooDBO109(p: G, n?: number): T;
  fooDDO109(p: G, n?: number): G;
  fooBBR109(p: T, ...n: number[]): T;
  fooBDR109(p: T, ...n: number[]): G;
  fooDBR109(p: G, ...n: number[]): T;
  fooDDR109(p: G, ...n: number[]): G;
}
class C109<T, G extends T> implements I109<T, G> {
  fooBB109(p: T): T { return p; }
  fooBD109(p: T): G { return p as G; }
  fooDB109(p: G): T { return p as T; }
  fooDD109(p: G): G { return p; }
  fooBBN109(p: T, n: number): T { return p; }
  fooBDN109(p: T, n: number): G { return p as G; }
  fooDBN109(p: G, n: number): T { return p as T; }
  fooDDN109(p: G, n: number): G { return p; }
  fooBBO109(p: T, n?: number): T { return p; }
  fooBDO109(p: T, n?: number): G { return p as G; }
  fooDBO109(p: G, n?: number): T { return p as T; }
  fooDDO109(p: G, n?: number): G { return p; }
  fooBBR109(p: T, ...n: number[]): T { return p; }
  fooBDR109(p: T, ...n: number[]): G { return p as G; }
  fooDBR109(p: G, ...n: number[]): T { return p as T; }
  fooDDR109(p: G, ...n: number[]): G { return p; }
}
let i109: I109<Base109, Derived109> = new C109<Base109, Derived109>();
let foobb109: (p: Base109) => Base109 = i109.fooBB109;
let foobd109: (p: Base109) => Derived109 = i109.fooBD109;
let foodb109: (p: Derived109) => Base109 = i109.fooDB109;
let foodd109: (p: Derived109) => Derived109 = i109.fooDD109;
let foobbn109: (p: Base109, n: number) => Base109 = i109.fooBBN109;
let foobdn109: (p: Base109, n: number) => Derived109 = i109.fooBDN109;
let foodbn109: (p: Derived109, n: number) => Base109 = i109.fooDBN109;
let fooddn109: (p: Derived109, n: number) => Derived109 = i109.fooDDN109;
let foobbo109: (p: Base109, n?: number) => Base109 = i109.fooBBO109;
let foobdo109: (p: Base109, n?: number) => Derived109 = i109.fooBDO109;
let foodbo109: (p: Derived109, n?: number) => Base109 = i109.fooDBO109;
let fooddo109: (p: Derived109, n?: number) => Derived109 = i109.fooDDO109;
let foobbr109: (p: Base109, ...n: number[]) => Base109 = i109.fooBBR109;
let foobdr109: (p: Base109, ...n: number[]) => Derived109 = i109.fooBDR109;
let foodbr109: (p: Derived109, ...n: number[]) => Base109 = i109.fooDBR109;
let fooddr109: (p: Derived109, ...n: number[]) => Derived109 = i109.fooDDR109;
foodbr109 = fooddr109;


class Base110 {}
class Derived110 extends Base110 {}
interface I110<T, G extends T> {
  fooBB110(p: T): T;
  fooBD110(p: T): G;
  fooDB110(p: G): T;
  fooDD110(p: G): G;
  fooBBN110(p: T, n: number): T;
  fooBDN110(p: T, n: number): G;
  fooDBN110(p: G, n: number): T;
  fooDDN110(p: G, n: number): G;
  fooBBO110(p: T, n?: number): T;
  fooBDO110(p: T, n?: number): G;
  fooDBO110(p: G, n?: number): T;
  fooDDO110(p: G, n?: number): G;
  fooBBR110(p: T, ...n: number[]): T;
  fooBDR110(p: T, ...n: number[]): G;
  fooDBR110(p: G, ...n: number[]): T;
  fooDDR110(p: G, ...n: number[]): G;
}
class C110<T, G extends T> implements I110<T, G> {
  fooBB110(p: T): T { return p; }
  fooBD110(p: T): G { return p as G; }
  fooDB110(p: G): T { return p as T; }
  fooDD110(p: G): G { return p; }
  fooBBN110(p: T, n: number): T { return p; }
  fooBDN110(p: T, n: number): G { return p as G; }
  fooDBN110(p: G, n: number): T { return p as T; }
  fooDDN110(p: G, n: number): G { return p; }
  fooBBO110(p: T, n?: number): T { return p; }
  fooBDO110(p: T, n?: number): G { return p as G; }
  fooDBO110(p: G, n?: number): T { return p as T; }
  fooDDO110(p: G, n?: number): G { return p; }
  fooBBR110(p: T, ...n: number[]): T { return p; }
  fooBDR110(p: T, ...n: number[]): G { return p as G; }
  fooDBR110(p: G, ...n: number[]): T { return p as T; }
  fooDDR110(p: G, ...n: number[]): G { return p; }
}
let i110: I110<Base110, Derived110> = new C110<Base110, Derived110>();
let foobb110: (p: Base110) => Base110 = i110.fooBB110;
let foobd110: (p: Base110) => Derived110 = i110.fooBD110;
let foodb110: (p: Derived110) => Base110 = i110.fooDB110;
let foodd110: (p: Derived110) => Derived110 = i110.fooDD110;
let foobbn110: (p: Base110, n: number) => Base110 = i110.fooBBN110;
let foobdn110: (p: Base110, n: number) => Derived110 = i110.fooBDN110;
let foodbn110: (p: Derived110, n: number) => Base110 = i110.fooDBN110;
let fooddn110: (p: Derived110, n: number) => Derived110 = i110.fooDDN110;
let foobbo110: (p: Base110, n?: number) => Base110 = i110.fooBBO110;
let foobdo110: (p: Base110, n?: number) => Derived110 = i110.fooBDO110;
let foodbo110: (p: Derived110, n?: number) => Base110 = i110.fooDBO110;
let fooddo110: (p: Derived110, n?: number) => Derived110 = i110.fooDDO110;
let foobbr110: (p: Base110, ...n: number[]) => Base110 = i110.fooBBR110;
let foobdr110: (p: Base110, ...n: number[]) => Derived110 = i110.fooBDR110;
let foodbr110: (p: Derived110, ...n: number[]) => Base110 = i110.fooDBR110;
let fooddr110: (p: Derived110, ...n: number[]) => Derived110 = i110.fooDDR110;
foodbn110 = foobdn110;


class Base111 {}
class Derived111 extends Base111 {}
interface I111<T, G extends T> {
  fooBB111(p: T): T;
  fooBD111(p: T): G;
  fooDB111(p: G): T;
  fooDD111(p: G): G;
  fooBBN111(p: T, n: number): T;
  fooBDN111(p: T, n: number): G;
  fooDBN111(p: G, n: number): T;
  fooDDN111(p: G, n: number): G;
  fooBBO111(p: T, n?: number): T;
  fooBDO111(p: T, n?: number): G;
  fooDBO111(p: G, n?: number): T;
  fooDDO111(p: G, n?: number): G;
  fooBBR111(p: T, ...n: number[]): T;
  fooBDR111(p: T, ...n: number[]): G;
  fooDBR111(p: G, ...n: number[]): T;
  fooDDR111(p: G, ...n: number[]): G;
}
class C111<T, G extends T> implements I111<T, G> {
  fooBB111(p: T): T { return p; }
  fooBD111(p: T): G { return p as G; }
  fooDB111(p: G): T { return p as T; }
  fooDD111(p: G): G { return p; }
  fooBBN111(p: T, n: number): T { return p; }
  fooBDN111(p: T, n: number): G { return p as G; }
  fooDBN111(p: G, n: number): T { return p as T; }
  fooDDN111(p: G, n: number): G { return p; }
  fooBBO111(p: T, n?: number): T { return p; }
  fooBDO111(p: T, n?: number): G { return p as G; }
  fooDBO111(p: G, n?: number): T { return p as T; }
  fooDDO111(p: G, n?: number): G { return p; }
  fooBBR111(p: T, ...n: number[]): T { return p; }
  fooBDR111(p: T, ...n: number[]): G { return p as G; }
  fooDBR111(p: G, ...n: number[]): T { return p as T; }
  fooDDR111(p: G, ...n: number[]): G { return p; }
}
let i111: I111<Base111, Derived111> = new C111<Base111, Derived111>();
let foobb111: (p: Base111) => Base111 = i111.fooBB111;
let foobd111: (p: Base111) => Derived111 = i111.fooBD111;
let foodb111: (p: Derived111) => Base111 = i111.fooDB111;
let foodd111: (p: Derived111) => Derived111 = i111.fooDD111;
let foobbn111: (p: Base111, n: number) => Base111 = i111.fooBBN111;
let foobdn111: (p: Base111, n: number) => Derived111 = i111.fooBDN111;
let foodbn111: (p: Derived111, n: number) => Base111 = i111.fooDBN111;
let fooddn111: (p: Derived111, n: number) => Derived111 = i111.fooDDN111;
let foobbo111: (p: Base111, n?: number) => Base111 = i111.fooBBO111;
let foobdo111: (p: Base111, n?: number) => Derived111 = i111.fooBDO111;
let foodbo111: (p: Derived111, n?: number) => Base111 = i111.fooDBO111;
let fooddo111: (p: Derived111, n?: number) => Derived111 = i111.fooDDO111;
let foobbr111: (p: Base111, ...n: number[]) => Base111 = i111.fooBBR111;
let foobdr111: (p: Base111, ...n: number[]) => Derived111 = i111.fooBDR111;
let foodbr111: (p: Derived111, ...n: number[]) => Base111 = i111.fooDBR111;
let fooddr111: (p: Derived111, ...n: number[]) => Derived111 = i111.fooDDR111;
foodbo111 = foobdo111;


class Base112 {}
class Derived112 extends Base112 {}
interface I112<T, G extends T> {
  fooBB112(p: T): T;
  fooBD112(p: T): G;
  fooDB112(p: G): T;
  fooDD112(p: G): G;
  fooBBN112(p: T, n: number): T;
  fooBDN112(p: T, n: number): G;
  fooDBN112(p: G, n: number): T;
  fooDDN112(p: G, n: number): G;
  fooBBO112(p: T, n?: number): T;
  fooBDO112(p: T, n?: number): G;
  fooDBO112(p: G, n?: number): T;
  fooDDO112(p: G, n?: number): G;
  fooBBR112(p: T, ...n: number[]): T;
  fooBDR112(p: T, ...n: number[]): G;
  fooDBR112(p: G, ...n: number[]): T;
  fooDDR112(p: G, ...n: number[]): G;
}
class C112<T, G extends T> implements I112<T, G> {
  fooBB112(p: T): T { return p; }
  fooBD112(p: T): G { return p as G; }
  fooDB112(p: G): T { return p as T; }
  fooDD112(p: G): G { return p; }
  fooBBN112(p: T, n: number): T { return p; }
  fooBDN112(p: T, n: number): G { return p as G; }
  fooDBN112(p: G, n: number): T { return p as T; }
  fooDDN112(p: G, n: number): G { return p; }
  fooBBO112(p: T, n?: number): T { return p; }
  fooBDO112(p: T, n?: number): G { return p as G; }
  fooDBO112(p: G, n?: number): T { return p as T; }
  fooDDO112(p: G, n?: number): G { return p; }
  fooBBR112(p: T, ...n: number[]): T { return p; }
  fooBDR112(p: T, ...n: number[]): G { return p as G; }
  fooDBR112(p: G, ...n: number[]): T { return p as T; }
  fooDDR112(p: G, ...n: number[]): G { return p; }
}
let i112: I112<Base112, Derived112> = new C112<Base112, Derived112>();
let foobb112: (p: Base112) => Base112 = i112.fooBB112;
let foobd112: (p: Base112) => Derived112 = i112.fooBD112;
let foodb112: (p: Derived112) => Base112 = i112.fooDB112;
let foodd112: (p: Derived112) => Derived112 = i112.fooDD112;
let foobbn112: (p: Base112, n: number) => Base112 = i112.fooBBN112;
let foobdn112: (p: Base112, n: number) => Derived112 = i112.fooBDN112;
let foodbn112: (p: Derived112, n: number) => Base112 = i112.fooDBN112;
let fooddn112: (p: Derived112, n: number) => Derived112 = i112.fooDDN112;
let foobbo112: (p: Base112, n?: number) => Base112 = i112.fooBBO112;
let foobdo112: (p: Base112, n?: number) => Derived112 = i112.fooBDO112;
let foodbo112: (p: Derived112, n?: number) => Base112 = i112.fooDBO112;
let fooddo112: (p: Derived112, n?: number) => Derived112 = i112.fooDDO112;
let foobbr112: (p: Base112, ...n: number[]) => Base112 = i112.fooBBR112;
let foobdr112: (p: Base112, ...n: number[]) => Derived112 = i112.fooBDR112;
let foodbr112: (p: Derived112, ...n: number[]) => Base112 = i112.fooDBR112;
let fooddr112: (p: Derived112, ...n: number[]) => Derived112 = i112.fooDDR112;
foodbr112 = foobdr112;


class Base113 {}
class Derived113 extends Base113 {}
interface I113<T, G extends T> {
  fooBB113(p: T): T;
  fooBD113(p: T): G;
  fooDB113(p: G): T;
  fooDD113(p: G): G;
  fooBBN113(p: T, n: number): T;
  fooBDN113(p: T, n: number): G;
  fooDBN113(p: G, n: number): T;
  fooDDN113(p: G, n: number): G;
  fooBBO113(p: T, n?: number): T;
  fooBDO113(p: T, n?: number): G;
  fooDBO113(p: G, n?: number): T;
  fooDDO113(p: G, n?: number): G;
  fooBBR113(p: T, ...n: number[]): T;
  fooBDR113(p: T, ...n: number[]): G;
  fooDBR113(p: G, ...n: number[]): T;
  fooDDR113(p: G, ...n: number[]): G;
}
class C113<T, G extends T> implements I113<T, G> {
  fooBB113(p: T): T { return p; }
  fooBD113(p: T): G { return p as G; }
  fooDB113(p: G): T { return p as T; }
  fooDD113(p: G): G { return p; }
  fooBBN113(p: T, n: number): T { return p; }
  fooBDN113(p: T, n: number): G { return p as G; }
  fooDBN113(p: G, n: number): T { return p as T; }
  fooDDN113(p: G, n: number): G { return p; }
  fooBBO113(p: T, n?: number): T { return p; }
  fooBDO113(p: T, n?: number): G { return p as G; }
  fooDBO113(p: G, n?: number): T { return p as T; }
  fooDDO113(p: G, n?: number): G { return p; }
  fooBBR113(p: T, ...n: number[]): T { return p; }
  fooBDR113(p: T, ...n: number[]): G { return p as G; }
  fooDBR113(p: G, ...n: number[]): T { return p as T; }
  fooDDR113(p: G, ...n: number[]): G { return p; }
}
let i113: I113<Base113, Derived113> = new C113<Base113, Derived113>();
let foobb113: (p: Base113) => Base113 = i113.fooBB113;
let foobd113: (p: Base113) => Derived113 = i113.fooBD113;
let foodb113: (p: Derived113) => Base113 = i113.fooDB113;
let foodd113: (p: Derived113) => Derived113 = i113.fooDD113;
let foobbn113: (p: Base113, n: number) => Base113 = i113.fooBBN113;
let foobdn113: (p: Base113, n: number) => Derived113 = i113.fooBDN113;
let foodbn113: (p: Derived113, n: number) => Base113 = i113.fooDBN113;
let fooddn113: (p: Derived113, n: number) => Derived113 = i113.fooDDN113;
let foobbo113: (p: Base113, n?: number) => Base113 = i113.fooBBO113;
let foobdo113: (p: Base113, n?: number) => Derived113 = i113.fooBDO113;
let foodbo113: (p: Derived113, n?: number) => Base113 = i113.fooDBO113;
let fooddo113: (p: Derived113, n?: number) => Derived113 = i113.fooDDO113;
let foobbr113: (p: Base113, ...n: number[]) => Base113 = i113.fooBBR113;
let foobdr113: (p: Base113, ...n: number[]) => Derived113 = i113.fooBDR113;
let foodbr113: (p: Derived113, ...n: number[]) => Base113 = i113.fooDBR113;
let fooddr113: (p: Derived113, ...n: number[]) => Derived113 = i113.fooDDR113;
foodbn113 = foobbn113;


export default function SubtypingForFunctionTypesTest04(): void {
  describe('SubtypingForFunctionTypesTest04', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.

    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_9200
     * @tc.name      testPositiveInterfaceMethod0092
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethod0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0092';

      expect(foodbo92(new Derived92) instanceof Derived92).assertTrue()
      expect(foodbo92(new Derived92).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_9300
     * @tc.name      testPositiveInterfaceMethod0093
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethod0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0093';

      expect(foodbr93(new Derived93, 1, 2, 3) instanceof Derived93).assertTrue()
      expect(foodbr93(new Derived93, 1, 2, 3).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_9400
     * @tc.name      testPositiveInterfaceMethod0094
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethod0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0094';

      let r = foodbn94.unsafeCall(new Base94, 1.0)
      expect(r instanceof Base94).assertTrue()
      expect((r as Base94).b).assertEqual('b')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_9500
     * @tc.name      testPositiveInterfaceMethod0095
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethod0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0095';

      let r = foodbo95.unsafeCall(new Derived95());
      expect(r instanceof Base95).assertTrue();
      expect((r as Base95).b).assertEqual('b');
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_9600
     * @tc.name      testPositiveInterfaceMethod0096
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethod0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0096';

      let r = foodbr96.unsafeCall(new Base96, 1.0, 2.0, 3.0)
      expect(r instanceof Base96).assertTrue()
      expect((r as Base96).b).assertEqual('b')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_9700
     * @tc.name      testPositiveInterfaceMethodGeneric0097
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0097';

      expect(foobb97(new Derived97) instanceof Base97).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_9800
     * @tc.name      testPositiveInterfaceMethodGeneric0098
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0098';

      expect(foodb98(new Derived98) instanceof Derived98).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_9900
     * @tc.name      testPositiveInterfaceMethodGeneric0099
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0099';

      expect(foodb99(new Derived99) instanceof Derived99).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_0100
     * @tc.name      testPositiveInterfaceMethodGeneric0100
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric00100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric00100';

      expect(foodd100(new Derived100) instanceof Base100).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_0200
     * @tc.name      testPositiveInterfaceMethodGeneric0101
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0101';

      expect(foobbn101(new Base101, 1) instanceof Base101).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_0300
     * @tc.name      testPositiveInterfaceMethodGeneric0102
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0102';

      expect(foobbo102(new Base102) instanceof Base102).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_0400
     * @tc.name      testPositiveInterfaceMethodGeneric0103
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0103';

      expect(foobbn103(new Derived103, 1) instanceof Base103).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_0500
     * @tc.name      testPositiveInterfaceMethodGeneric0104
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0104';

      expect(foobbo104(new Derived104) instanceof Base104).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_0600
     * @tc.name      testPositiveInterfaceMethodGeneric0105
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0105';

      expect(foodbn105(new Derived105, 1) instanceof Base105).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_0700
     * @tc.name      testPositiveInterfaceMethodGeneric0106
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0106';

      expect(foodbo106(new Derived106) instanceof Base106).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_0800
     * @tc.name      testPositiveInterfaceMethodGeneric0107
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0107';

      expect(foodbn107(new Derived107, 1) instanceof Derived107).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_0900
     * @tc.name      testPositiveInterfaceMethodGeneric0108
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0108';

      expect(foodbo108(new Derived108) instanceof Derived108).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_1000
     * @tc.name      testPositiveInterfaceMethodGeneric0109
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0109';

      expect(foodbr109(new Derived109, 1, 2, 3) instanceof Derived109).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_1100
     * @tc.name      testPositiveInterfaceMethodGeneric0110
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0110';

      expect(foodbn110(new Derived110, 1) instanceof Base110).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_1200
     * @tc.name      testPositiveInterfaceMethodGeneric0111
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0111';

      expect(foodbo111(new Derived111) instanceof Base111).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_1300
     * @tc.name      testPositiveInterfaceMethodGeneric0112
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0112';

      expect(foodbr112(new Derived112, 1, 2, 3) instanceof Base112).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_1400
     * @tc.name      testPositiveInterfaceMethodGeneric0113
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInterfaceMethodGeneric0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0113';

      let r = foodbn113.unsafeCall(new Base113, 1.0)
      expect(r instanceof Base113).assertTrue()
    })
  })
}