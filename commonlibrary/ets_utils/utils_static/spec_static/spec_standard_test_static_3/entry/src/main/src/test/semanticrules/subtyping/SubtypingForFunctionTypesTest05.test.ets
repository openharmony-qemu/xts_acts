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

class Base114 {}
class Derived114 extends Base114 {}
interface I114<T, G extends T> {
  fooBB114(p: T): T;
  fooBD114(p: T): G;
  fooDB114(p: G): T;
  fooDD114(p: G): G;
  fooBBN114(p: T, n: number): T;
  fooBDN114(p: T, n: number): G;
  fooDBN114(p: G, n: number): T;
  fooDDN114(p: G, n: number): G;
  fooBBO114(p: T, n?: number): T;
  fooBDO114(p: T, n?: number): G;
  fooDBO114(p: G, n?: number): T;
  fooDDO114(p: G, n?: number): G;
  fooBBR114(p: T, ...n: number[]): T;
  fooBDR114(p: T, ...n: number[]): G;
  fooDBR114(p: G, ...n: number[]): T;
  fooDDR114(p: G, ...n: number[]): G;
}
class C114<T, G extends T> implements I114<T, G> {
  fooBB114(p: T): T { return p; }
  fooBD114(p: T): G { return p as G; }
  fooDB114(p: G): T { return p as T; }
  fooDD114(p: G): G { return p; }
  fooBBN114(p: T, n: number): T { return p; }
  fooBDN114(p: T, n: number): G { return p as G; }
  fooDBN114(p: G, n: number): T { return p as T; }
  fooDDN114(p: G, n: number): G { return p; }
  fooBBO114(p: T, n?: number): T { return p; }
  fooBDO114(p: T, n?: number): G { return p as G; }
  fooDBO114(p: G, n?: number): T { return p as T; }
  fooDDO114(p: G, n?: number): G { return p; }
  fooBBR114(p: T, ...n: number[]): T { return p; }
  fooBDR114(p: T, ...n: number[]): G { return p as G; }
  fooDBR114(p: G, ...n: number[]): T { return p as T; }
  fooDDR114(p: G, ...n: number[]): G { return p; }
}
let i114: I114<Base114, Derived114> = new C114<Base114, Derived114>();
let foobb114: (p: Base114) => Base114 = i114.fooBB114;
let foobd114: (p: Base114) => Derived114 = i114.fooBD114;
let foodb114: (p: Derived114) => Base114 = i114.fooDB114;
let foodd114: (p: Derived114) => Derived114 = i114.fooDD114;
let foobbn114: (p: Base114, n: number) => Base114 = i114.fooBBN114;
let foobdn114: (p: Base114, n: number) => Derived114 = i114.fooBDN114;
let foodbn114: (p: Derived114, n: number) => Base114 = i114.fooDBN114;
let fooddn114: (p: Derived114, n: number) => Derived114 = i114.fooDDN114;
let foobbo114: (p: Base114, n?: number) => Base114 = i114.fooBBO114;
let foobdo114: (p: Base114, n?: number) => Derived114 = i114.fooBDO114;
let foodbo114: (p: Derived114, n?: number) => Base114 = i114.fooDBO114;
let fooddo114: (p: Derived114, n?: number) => Derived114 = i114.fooDDO114;
let foobbr114: (p: Base114, ...n: number[]) => Base114 = i114.fooBBR114;
let foobdr114: (p: Base114, ...n: number[]) => Derived114 = i114.fooBDR114;
let foodbr114: (p: Derived114, ...n: number[]) => Base114 = i114.fooDBR114;
let fooddr114: (p: Derived114, ...n: number[]) => Derived114 = i114.fooDDR114;
foodbo114 = foobbo114;


class Base115 {}
class Derived115 extends Base115 {}
interface I115<T, G extends T> {
  fooBB115(p: T): T;
  fooBD115(p: T): G;
  fooDB115(p: G): T;
  fooDD115(p: G): G;
  fooBBN115(p: T, n: number): T;
  fooBDN115(p: T, n: number): G;
  fooDBN115(p: G, n: number): T;
  fooDDN115(p: G, n: number): G;
  fooBBO115(p: T, n?: number): T;
  fooBDO115(p: T, n?: number): G;
  fooDBO115(p: G, n?: number): T;
  fooDDO115(p: G, n?: number): G;
  fooBBR115(p: T, ...n: number[]): T;
  fooBDR115(p: T, ...n: number[]): G;
  fooDBR115(p: G, ...n: number[]): T;
  fooDDR115(p: G, ...n: number[]): G;
}
class C115<T, G extends T> implements I115<T, G> {
  fooBB115(p: T): T { return p; }
  fooBD115(p: T): G { return p as G; }
  fooDB115(p: G): T { return p as T; }
  fooDD115(p: G): G { return p; }
  fooBBN115(p: T, n: number): T { return p; }
  fooBDN115(p: T, n: number): G { return p as G; }
  fooDBN115(p: G, n: number): T { return p as T; }
  fooDDN115(p: G, n: number): G { return p; }
  fooBBO115(p: T, n?: number): T { return p; }
  fooBDO115(p: T, n?: number): G { return p as G; }
  fooDBO115(p: G, n?: number): T { return p as T; }
  fooDDO115(p: G, n?: number): G { return p; }
  fooBBR115(p: T, ...n: number[]): T { return p; }
  fooBDR115(p: T, ...n: number[]): G { return p as G; }
  fooDBR115(p: G, ...n: number[]): T { return p as T; }
  fooDDR115(p: G, ...n: number[]): G { return p; }
}
let i115: I115<Base115, Derived115> = new C115<Base115, Derived115>();
let foobb115: (p: Base115) => Base115 = i115.fooBB115;
let foobd115: (p: Base115) => Derived115 = i115.fooBD115;
let foodb115: (p: Derived115) => Base115 = i115.fooDB115;
let foodd115: (p: Derived115) => Derived115 = i115.fooDD115;
let foobbn115: (p: Base115, n: number) => Base115 = i115.fooBBN115;
let foobdn115: (p: Base115, n: number) => Derived115 = i115.fooBDN115;
let foodbn115: (p: Derived115, n: number) => Base115 = i115.fooDBN115;
let fooddn115: (p: Derived115, n: number) => Derived115 = i115.fooDDN115;
let foobbo115: (p: Base115, n?: number) => Base115 = i115.fooBBO115;
let foobdo115: (p: Base115, n?: number) => Derived115 = i115.fooBDO115;
let foodbo115: (p: Derived115, n?: number) => Base115 = i115.fooDBO115;
let fooddo115: (p: Derived115, n?: number) => Derived115 = i115.fooDDO115;
let foobbr115: (p: Base115, ...n: number[]) => Base115 = i115.fooBBR115;
let foobdr115: (p: Base115, ...n: number[]) => Derived115 = i115.fooBDR115;
let foodbr115: (p: Derived115, ...n: number[]) => Base115 = i115.fooDBR115;
let fooddr115: (p: Derived115, ...n: number[]) => Derived115 = i115.fooDDR115;
foodbr115 = foobbr115;


class Base116 {
  b: string = 'b'
}
class Derived116 extends Base116 {
  b: string = 'd'
}
let foobb116: (p: Base116) => Base116 = (p: Base116) => { return new Base116 }
let foobd116: (p: Base116) => Derived116 = (p: Base116) => { return new Derived116 }
let foodb116: (p: Derived116) => Base116 = (p: Derived116) => { return new Base116 }
let foodd116: (p: Derived116) => Derived116 = (p: Derived116) => { return new Derived116 }
let foobbn116: (p: Base116, n: number) => Base116 = (p: Base116, n: number) => { return new Base116() };
let foobdn116: (p: Base116, n: number) => Derived116 = (p: Base116, n: number) => { return new Derived116() };
let foodbn116: (p: Derived116, n: number) => Base116 = (p: Derived116, n: number) => { return new Base116() };
let fooddn116: (p: Derived116, n: number) => Derived116 = (p: Derived116, n: number) => { return new Derived116() };
let foobbo116: (p: Base116, n?: number) => Base116 = (p: Base116, n?: number) => { return new Base116() };
let foobdo116: (p: Base116, n?: number) => Derived116 = (p: Base116, n?: number) => { return new Derived116() };
let foodbo116: (p: Derived116, n?: number) => Base116 = (p: Derived116, n?: number) => { return new Base116() };
let fooddo116: (p: Derived116, n?: number) => Derived116 = (p: Derived116, n?: number) => { return new Derived116() };
let foobbr116: (p: Base116, ...n: number[]) => Base116 = (p: Base116, ...n: number[]) => { return new Base116() };
let foobdr116: (p: Base116, ...n: number[]) => Derived116 = (p: Base116, ...n: number[]) => { return new Derived116() };
let foodbr116: (p: Derived116, ...n: number[]) => Base116 = (p: Derived116, ...n: number[]) => { return new Base116() };
let fooddr116: (p: Derived116, ...n: number[]) => Derived116 = (p: Derived116, ...n: number[]) => { return new Derived116() };
foobb116 = foobd116 // OK: identical parameter types, and covariant return type


class Base117 {
  b: string = 'b'
}
class Derived117 extends Base117 {
  b: string = 'd'
}
let foobb117: (p: Base117) => Base117 = (p: Base117) => { return new Base117 }
let foobd117: (p: Base117) => Derived117 = (p: Base117) => { return new Derived117 }
let foodb117: (p: Derived117) => Base117 = (p: Derived117) => { return new Base117 }
let foodd117: (p: Derived117) => Derived117 = (p: Derived117) => { return new Derived117 }
let foobbn117: (p: Base117, n: number) => Base117 = (p: Base117, n: number) => { return new Base117() };
let foobdn117: (p: Base117, n: number) => Derived117 = (p: Base117, n: number) => { return new Derived117() };
let foodbn117: (p: Derived117, n: number) => Base117 = (p: Derived117, n: number) => { return new Base117() };
let fooddn117: (p: Derived117, n: number) => Derived117 = (p: Derived117, n: number) => { return new Derived117() };
let foobbo117: (p: Base117, n?: number) => Base117 = (p: Base117, n?: number) => { return new Base117() };
let foobdo117: (p: Base117, n?: number) => Derived117 = (p: Base117, n?: number) => { return new Derived117() };
let foodbo117: (p: Derived117, n?: number) => Base117 = (p: Derived117, n?: number) => { return new Base117() };
let fooddo117: (p: Derived117, n?: number) => Derived117 = (p: Derived117, n?: number) => { return new Derived117() };
let foobbr117: (p: Base117, ...n: number[]) => Base117 = (p: Base117, ...n: number[]) => { return new Base117() };
let foobdr117: (p: Base117, ...n: number[]) => Derived117 = (p: Base117, ...n: number[]) => { return new Derived117() };
let foodbr117: (p: Derived117, ...n: number[]) => Base117 = (p: Derived117, ...n: number[]) => { return new Base117() };
let fooddr117: (p: Derived117, ...n: number[]) => Derived117 = (p: Derived117, ...n: number[]) => { return new Derived117() };
foodb117 = foobd117


class Base118 {
  b: string = 'b'
}
class Derived118 extends Base118 {
  b: string = 'd'
}
let foobb118: (p: Base118) => Base118 = (p: Base118) => { return new Base118 }
let foobd118: (p: Base118) => Derived118 = (p: Base118) => { return new Derived118 }
let foodb118: (p: Derived118) => Base118 = (p: Derived118) => { return new Base118 }
let foodd118: (p: Derived118) => Derived118 = (p: Derived118) => { return new Derived118 }
let foobbn118: (p: Base118, n: number) => Base118 = (p: Base118, n: number) => { return new Base118() };
let foobdn118: (p: Base118, n: number) => Derived118 = (p: Base118, n: number) => { return new Derived118() };
let foodbn118: (p: Derived118, n: number) => Base118 = (p: Derived118, n: number) => { return new Base118() };
let fooddn118: (p: Derived118, n: number) => Derived118 = (p: Derived118, n: number) => { return new Derived118() };
let foobbo118: (p: Base118, n?: number) => Base118 = (p: Base118, n?: number) => { return new Base118() };
let foobdo118: (p: Base118, n?: number) => Derived118 = (p: Base118, n?: number) => { return new Derived118() };
let foodbo118: (p: Derived118, n?: number) => Base118 = (p: Derived118, n?: number) => { return new Base118() };
let fooddo118: (p: Derived118, n?: number) => Derived118 = (p: Derived118, n?: number) => { return new Derived118() };
let foobbr118: (p: Base118, ...n: number[]) => Base118 = (p: Base118, ...n: number[]) => { return new Base118() };
let foobdr118: (p: Base118, ...n: number[]) => Derived118 = (p: Base118, ...n: number[]) => { return new Derived118() };
let foodbr118: (p: Derived118, ...n: number[]) => Base118 = (p: Derived118, ...n: number[]) => { return new Base118() };
let fooddr118: (p: Derived118, ...n: number[]) => Derived118 = (p: Derived118, ...n: number[]) => { return new Derived118() };
foodb118 = foodd118


class Base119 {
  b: string = 'b'
}
class Derived119 extends Base119 {
  b: string = 'd'
}
let foobb119: (p: Base119) => Base119 = (p: Base119) => { return new Base119 }
let foobd119: (p: Base119) => Derived119 = (p: Base119) => { return new Derived119 }
let foodb119: (p: Derived119) => Base119 = (p: Derived119) => { return new Base119 }
let foodd119: (p: Derived119) => Derived119 = (p: Derived119) => { return new Derived119 }
let foobbn119: (p: Base119, n: number) => Base119 = (p: Base119, n: number) => { return new Base119() };
let foobdn119: (p: Base119, n: number) => Derived119 = (p: Base119, n: number) => { return new Derived119() };
let foodbn119: (p: Derived119, n: number) => Base119 = (p: Derived119, n: number) => { return new Base119() };
let fooddn119: (p: Derived119, n: number) => Derived119 = (p: Derived119, n: number) => { return new Derived119() };
let foobbo119: (p: Base119, n?: number) => Base119 = (p: Base119, n?: number) => { return new Base119() };
let foobdo119: (p: Base119, n?: number) => Derived119 = (p: Base119, n?: number) => { return new Derived119() };
let foodbo119: (p: Derived119, n?: number) => Base119 = (p: Derived119, n?: number) => { return new Base119() };
let fooddo119: (p: Derived119, n?: number) => Derived119 = (p: Derived119, n?: number) => { return new Derived119() };
let foobbr119: (p: Base119, ...n: number[]) => Base119 = (p: Base119, ...n: number[]) => { return new Base119() };
let foobdr119: (p: Base119, ...n: number[]) => Derived119 = (p: Base119, ...n: number[]) => { return new Derived119() };
let foodbr119: (p: Derived119, ...n: number[]) => Base119 = (p: Derived119, ...n: number[]) => { return new Base119() };
let fooddr119: (p: Derived119, ...n: number[]) => Derived119 = (p: Derived119, ...n: number[]) => { return new Derived119() };
foodd119 = foobd119


class Base120 {
  b: string = 'b'
}
class Derived120 extends Base120 {
  b: string = 'd'
}
let foobb120: (p: Base120) => Base120 = (p: Base120) => { return new Base120 }
let foobd120: (p: Base120) => Derived120 = (p: Base120) => { return new Derived120 }
let foodb120: (p: Derived120) => Base120 = (p: Derived120) => { return new Base120 }
let foodd120: (p: Derived120) => Derived120 = (p: Derived120) => { return new Derived120 }
let foobbn120: (p: Base120, n: number) => Base120 = (p: Base120, n: number) => { return new Base120() };
let foobdn120: (p: Base120, n: number) => Derived120 = (p: Base120, n: number) => { return new Derived120() };
let foodbn120: (p: Derived120, n: number) => Base120 = (p: Derived120, n: number) => { return new Base120() };
let fooddn120: (p: Derived120, n: number) => Derived120 = (p: Derived120, n: number) => { return new Derived120() };
let foobbo120: (p: Base120, n?: number) => Base120 = (p: Base120, n?: number) => { return new Base120() };
let foobdo120: (p: Base120, n?: number) => Derived120 = (p: Base120, n?: number) => { return new Derived120() };
let foodbo120: (p: Derived120, n?: number) => Base120 = (p: Derived120, n?: number) => { return new Base120() };
let fooddo120: (p: Derived120, n?: number) => Derived120 = (p: Derived120, n?: number) => { return new Derived120() };
let foobbr120: (p: Base120, ...n: number[]) => Base120 = (p: Base120, ...n: number[]) => { return new Base120() };
let foobdr120: (p: Base120, ...n: number[]) => Derived120 = (p: Base120, ...n: number[]) => { return new Derived120() };
let foodbr120: (p: Derived120, ...n: number[]) => Base120 = (p: Derived120, ...n: number[]) => { return new Base120() };
let fooddr120: (p: Derived120, ...n: number[]) => Derived120 = (p: Derived120, ...n: number[]) => { return new Derived120() };
foobbn120 = foobb120


class Base121 {
  b: string = 'b'
}
class Derived121 extends Base121 {
  b: string = 'd'
}
let foobb121: (p: Base121) => Base121 = (p: Base121) => { return new Base121 }
let foobd121: (p: Base121) => Derived121 = (p: Base121) => { return new Derived121 }
let foodb121: (p: Derived121) => Base121 = (p: Derived121) => { return new Base121 }
let foodd121: (p: Derived121) => Derived121 = (p: Derived121) => { return new Derived121 }
let foobbn121: (p: Base121, n: number) => Base121 = (p: Base121, n: number) => { return new Base121() };
let foobdn121: (p: Base121, n: number) => Derived121 = (p: Base121, n: number) => { return new Derived121() };
let foodbn121: (p: Derived121, n: number) => Base121 = (p: Derived121, n: number) => { return new Base121() };
let fooddn121: (p: Derived121, n: number) => Derived121 = (p: Derived121, n: number) => { return new Derived121() };
let foobbo121: (p: Base121, n?: number) => Base121 = (p: Base121, n?: number) => { return new Base121() };
let foobdo121: (p: Base121, n?: number) => Derived121 = (p: Base121, n?: number) => { return new Derived121() };
let foodbo121: (p: Derived121, n?: number) => Base121 = (p: Derived121, n?: number) => { return new Base121() };
let fooddo121: (p: Derived121, n?: number) => Derived121 = (p: Derived121, n?: number) => { return new Derived121() };
let foobbr121: (p: Base121, ...n: number[]) => Base121 = (p: Base121, ...n: number[]) => { return new Base121() };
let foobdr121: (p: Base121, ...n: number[]) => Derived121 = (p: Base121, ...n: number[]) => { return new Derived121() };
let foodbr121: (p: Derived121, ...n: number[]) => Base121 = (p: Derived121, ...n: number[]) => { return new Base121() };
let fooddr121: (p: Derived121, ...n: number[]) => Derived121 = (p: Derived121, ...n: number[]) => { return new Derived121() };
foobbo121 = foobb121


class Base122 {
  b: string = 'b'
}
class Derived122 extends Base122 {
  b: string = 'd'
}
let foobb122: (p: Base122) => Base122 = (p: Base122) => { return new Base122 }
let foobd122: (p: Base122) => Derived122 = (p: Base122) => { return new Derived122 }
let foodb122: (p: Derived122) => Base122 = (p: Derived122) => { return new Base122 }
let foodd122: (p: Derived122) => Derived122 = (p: Derived122) => { return new Derived122 }
let foobbn122: (p: Base122, n: number) => Base122 = (p: Base122, n: number) => { return new Base122() };
let foobdn122: (p: Base122, n: number) => Derived122 = (p: Base122, n: number) => { return new Derived122() };
let foodbn122: (p: Derived122, n: number) => Base122 = (p: Derived122, n: number) => { return new Base122() };
let fooddn122: (p: Derived122, n: number) => Derived122 = (p: Derived122, n: number) => { return new Derived122() };
let foobbo122: (p: Base122, n?: number) => Base122 = (p: Base122, n?: number) => { return new Base122() };
let foobdo122: (p: Base122, n?: number) => Derived122 = (p: Base122, n?: number) => { return new Derived122() };
let foodbo122: (p: Derived122, n?: number) => Base122 = (p: Derived122, n?: number) => { return new Base122() };
let fooddo122: (p: Derived122, n?: number) => Derived122 = (p: Derived122, n?: number) => { return new Derived122() };
let foobbr122: (p: Base122, ...n: number[]) => Base122 = (p: Base122, ...n: number[]) => { return new Base122() };
let foobdr122: (p: Base122, ...n: number[]) => Derived122 = (p: Base122, ...n: number[]) => { return new Derived122() };
let foodbr122: (p: Derived122, ...n: number[]) => Base122 = (p: Derived122, ...n: number[]) => { return new Base122() };
let fooddr122: (p: Derived122, ...n: number[]) => Derived122 = (p: Derived122, ...n: number[]) => { return new Derived122() };
foobbn122 = foobd122


class Base123 {
  b: string = 'b'
}
class Derived123 extends Base123 {
  b: string = 'd'
}
let foobb123: (p: Base123) => Base123 = (p: Base123) => { return new Base123 }
let foobd123: (p: Base123) => Derived123 = (p: Base123) => { return new Derived123 }
let foodb123: (p: Derived123) => Base123 = (p: Derived123) => { return new Base123 }
let foodd123: (p: Derived123) => Derived123 = (p: Derived123) => { return new Derived123 }
let foobbn123: (p: Base123, n: number) => Base123 = (p: Base123, n: number) => { return new Base123() };
let foobdn123: (p: Base123, n: number) => Derived123 = (p: Base123, n: number) => { return new Derived123() };
let foodbn123: (p: Derived123, n: number) => Base123 = (p: Derived123, n: number) => { return new Base123() };
let fooddn123: (p: Derived123, n: number) => Derived123 = (p: Derived123, n: number) => { return new Derived123() };
let foobbo123: (p: Base123, n?: number) => Base123 = (p: Base123, n?: number) => { return new Base123() };
let foobdo123: (p: Base123, n?: number) => Derived123 = (p: Base123, n?: number) => { return new Derived123() };
let foodbo123: (p: Derived123, n?: number) => Base123 = (p: Derived123, n?: number) => { return new Base123() };
let fooddo123: (p: Derived123, n?: number) => Derived123 = (p: Derived123, n?: number) => { return new Derived123() };
let foobbr123: (p: Base123, ...n: number[]) => Base123 = (p: Base123, ...n: number[]) => { return new Base123() };
let foobdr123: (p: Base123, ...n: number[]) => Derived123 = (p: Base123, ...n: number[]) => { return new Derived123() };
let foodbr123: (p: Derived123, ...n: number[]) => Base123 = (p: Derived123, ...n: number[]) => { return new Base123() };
let fooddr123: (p: Derived123, ...n: number[]) => Derived123 = (p: Derived123, ...n: number[]) => { return new Derived123() };
foobbo123 = foobd123


class Base124 {
  b: string = 'b'
}
class Derived124 extends Base124 {
  b: string = 'd'
}
let foobb124: (p: Base124) => Base124 = (p: Base124) => { return new Base124 }
let foobd124: (p: Base124) => Derived124 = (p: Base124) => { return new Derived124 }
let foodb124: (p: Derived124) => Base124 = (p: Derived124) => { return new Base124 }
let foodd124: (p: Derived124) => Derived124 = (p: Derived124) => { return new Derived124 }
let foobbn124: (p: Base124, n: number) => Base124 = (p: Base124, n: number) => { return new Base124() };
let foobdn124: (p: Base124, n: number) => Derived124 = (p: Base124, n: number) => { return new Derived124() };
let foodbn124: (p: Derived124, n: number) => Base124 = (p: Derived124, n: number) => { return new Base124() };
let fooddn124: (p: Derived124, n: number) => Derived124 = (p: Derived124, n: number) => { return new Derived124() };
let foobbo124: (p: Base124, n?: number) => Base124 = (p: Base124, n?: number) => { return new Base124() };
let foobdo124: (p: Base124, n?: number) => Derived124 = (p: Base124, n?: number) => { return new Derived124() };
let foodbo124: (p: Derived124, n?: number) => Base124 = (p: Derived124, n?: number) => { return new Base124() };
let fooddo124: (p: Derived124, n?: number) => Derived124 = (p: Derived124, n?: number) => { return new Derived124() };
let foobbr124: (p: Base124, ...n: number[]) => Base124 = (p: Base124, ...n: number[]) => { return new Base124() };
let foobdr124: (p: Base124, ...n: number[]) => Derived124 = (p: Base124, ...n: number[]) => { return new Derived124() };
let foodbr124: (p: Derived124, ...n: number[]) => Base124 = (p: Derived124, ...n: number[]) => { return new Base124() };
let fooddr124: (p: Derived124, ...n: number[]) => Derived124 = (p: Derived124, ...n: number[]) => { return new Derived124() };
foodbn124 = foobd124


class Base125 {
  b: string = 'b'
}
class Derived125 extends Base125 {
  b: string = 'd'
}
let foobb125: (p: Base125) => Base125 = (p: Base125) => { return new Base125 }
let foobd125: (p: Base125) => Derived125 = (p: Base125) => { return new Derived125 }
let foodb125: (p: Derived125) => Base125 = (p: Derived125) => { return new Base125 }
let foodd125: (p: Derived125) => Derived125 = (p: Derived125) => { return new Derived125 }
let foobbn125: (p: Base125, n: number) => Base125 = (p: Base125, n: number) => { return new Base125() };
let foobdn125: (p: Base125, n: number) => Derived125 = (p: Base125, n: number) => { return new Derived125() };
let foodbn125: (p: Derived125, n: number) => Base125 = (p: Derived125, n: number) => { return new Base125() };
let fooddn125: (p: Derived125, n: number) => Derived125 = (p: Derived125, n: number) => { return new Derived125() };
let foobbo125: (p: Base125, n?: number) => Base125 = (p: Base125, n?: number) => { return new Base125() };
let foobdo125: (p: Base125, n?: number) => Derived125 = (p: Base125, n?: number) => { return new Derived125() };
let foodbo125: (p: Derived125, n?: number) => Base125 = (p: Derived125, n?: number) => { return new Base125() };
let fooddo125: (p: Derived125, n?: number) => Derived125 = (p: Derived125, n?: number) => { return new Derived125() };
let foobbr125: (p: Base125, ...n: number[]) => Base125 = (p: Base125, ...n: number[]) => { return new Base125() };
let foobdr125: (p: Base125, ...n: number[]) => Derived125 = (p: Base125, ...n: number[]) => { return new Derived125() };
let foodbr125: (p: Derived125, ...n: number[]) => Base125 = (p: Derived125, ...n: number[]) => { return new Base125() };
let fooddr125: (p: Derived125, ...n: number[]) => Derived125 = (p: Derived125, ...n: number[]) => { return new Derived125() };
foodbo125 = foobd125


class Base126 {
  b: string = 'b'
}
class Derived126 extends Base126 {
  b: string = 'd'
}
let foobb126: (p: Base126) => Base126 = (p: Base126) => { return new Base126 }
let foobd126: (p: Base126) => Derived126 = (p: Base126) => { return new Derived126 }
let foodb126: (p: Derived126) => Base126 = (p: Derived126) => { return new Base126 }
let foodd126: (p: Derived126) => Derived126 = (p: Derived126) => { return new Derived126 }
let foobbn126: (p: Base126, n: number) => Base126 = (p: Base126, n: number) => { return new Base126() };
let foobdn126: (p: Base126, n: number) => Derived126 = (p: Base126, n: number) => { return new Derived126() };
let foodbn126: (p: Derived126, n: number) => Base126 = (p: Derived126, n: number) => { return new Base126() };
let fooddn126: (p: Derived126, n: number) => Derived126 = (p: Derived126, n: number) => { return new Derived126() };
let foobbo126: (p: Base126, n?: number) => Base126 = (p: Base126, n?: number) => { return new Base126() };
let foobdo126: (p: Base126, n?: number) => Derived126 = (p: Base126, n?: number) => { return new Derived126() };
let foodbo126: (p: Derived126, n?: number) => Base126 = (p: Derived126, n?: number) => { return new Base126() };
let fooddo126: (p: Derived126, n?: number) => Derived126 = (p: Derived126, n?: number) => { return new Derived126() };
let foobbr126: (p: Base126, ...n: number[]) => Base126 = (p: Base126, ...n: number[]) => { return new Base126() };
let foobdr126: (p: Base126, ...n: number[]) => Derived126 = (p: Base126, ...n: number[]) => { return new Derived126() };
let foodbr126: (p: Derived126, ...n: number[]) => Base126 = (p: Derived126, ...n: number[]) => { return new Base126() };
let fooddr126: (p: Derived126, ...n: number[]) => Derived126 = (p: Derived126, ...n: number[]) => { return new Derived126() };
foodbn126 = foobdn126


class Base127 {
  b: string = 'b'
}
class Derived127 extends Base127 {
  b: string = 'd'
}
let foobb127: (p: Base127) => Base127 = (p: Base127) => { return new Base127 }
let foobd127: (p: Base127) => Derived127 = (p: Base127) => { return new Derived127 }
let foodb127: (p: Derived127) => Base127 = (p: Derived127) => { return new Base127 }
let foodd127: (p: Derived127) => Derived127 = (p: Derived127) => { return new Derived127 }
let foobbn127: (p: Base127, n: number) => Base127 = (p: Base127, n: number) => { return new Base127() };
let foobdn127: (p: Base127, n: number) => Derived127 = (p: Base127, n: number) => { return new Derived127() };
let foodbn127: (p: Derived127, n: number) => Base127 = (p: Derived127, n: number) => { return new Base127() };
let fooddn127: (p: Derived127, n: number) => Derived127 = (p: Derived127, n: number) => { return new Derived127() };
let foobbo127: (p: Base127, n?: number) => Base127 = (p: Base127, n?: number) => { return new Base127() };
let foobdo127: (p: Base127, n?: number) => Derived127 = (p: Base127, n?: number) => { return new Derived127() };
let foodbo127: (p: Derived127, n?: number) => Base127 = (p: Derived127, n?: number) => { return new Base127() };
let fooddo127: (p: Derived127, n?: number) => Derived127 = (p: Derived127, n?: number) => { return new Derived127() };
let foobbr127: (p: Base127, ...n: number[]) => Base127 = (p: Base127, ...n: number[]) => { return new Base127() };
let foobdr127: (p: Base127, ...n: number[]) => Derived127 = (p: Base127, ...n: number[]) => { return new Derived127() };
let foodbr127: (p: Derived127, ...n: number[]) => Base127 = (p: Derived127, ...n: number[]) => { return new Base127() };
let fooddr127: (p: Derived127, ...n: number[]) => Derived127 = (p: Derived127, ...n: number[]) => { return new Derived127() };
foodbo127 = foobdo127


class Base128 {
  b: string = 'b'
}
class Derived128 extends Base128 {
  b: string = 'd'
}
let foobb128: (p: Base128) => Base128 = (p: Base128) => { return new Base128 }
let foobd128: (p: Base128) => Derived128 = (p: Base128) => { return new Derived128 }
let foodb128: (p: Derived128) => Base128 = (p: Derived128) => { return new Base128 }
let foodd128: (p: Derived128) => Derived128 = (p: Derived128) => { return new Derived128 }
let foobbn128: (p: Base128, n: number) => Base128 = (p: Base128, n: number) => { return new Base128() };
let foobdn128: (p: Base128, n: number) => Derived128 = (p: Base128, n: number) => { return new Derived128() };
let foodbn128: (p: Derived128, n: number) => Base128 = (p: Derived128, n: number) => { return new Base128() };
let fooddn128: (p: Derived128, n: number) => Derived128 = (p: Derived128, n: number) => { return new Derived128() };
let foobbo128: (p: Base128, n?: number) => Base128 = (p: Base128, n?: number) => { return new Base128() };
let foobdo128: (p: Base128, n?: number) => Derived128 = (p: Base128, n?: number) => { return new Derived128() };
let foodbo128: (p: Derived128, n?: number) => Base128 = (p: Derived128, n?: number) => { return new Base128() };
let fooddo128: (p: Derived128, n?: number) => Derived128 = (p: Derived128, n?: number) => { return new Derived128() };
let foobbr128: (p: Base128, ...n: number[]) => Base128 = (p: Base128, ...n: number[]) => { return new Base128() };
let foobdr128: (p: Base128, ...n: number[]) => Derived128 = (p: Base128, ...n: number[]) => { return new Derived128() };
let foodbr128: (p: Derived128, ...n: number[]) => Base128 = (p: Derived128, ...n: number[]) => { return new Base128() };
let fooddr128: (p: Derived128, ...n: number[]) => Derived128 = (p: Derived128, ...n: number[]) => { return new Derived128() };
foodbr128 = fooddr128


class Base129 {
  b: string = 'b'
}
class Derived129 extends Base129 {
  b: string = 'd'
}
let foobb129: (p: Base129) => Base129 = (p: Base129) => { return new Base129 }
let foobd129: (p: Base129) => Derived129 = (p: Base129) => { return new Derived129 }
let foodb129: (p: Derived129) => Base129 = (p: Derived129) => { return new Base129 }
let foodd129: (p: Derived129) => Derived129 = (p: Derived129) => { return new Derived129 }
let foobbn129: (p: Base129, n: number) => Base129 = (p: Base129, n: number) => { return new Base129() };
let foobdn129: (p: Base129, n: number) => Derived129 = (p: Base129, n: number) => { return new Derived129() };
let foodbn129: (p: Derived129, n: number) => Base129 = (p: Derived129, n: number) => { return new Base129() };
let fooddn129: (p: Derived129, n: number) => Derived129 = (p: Derived129, n: number) => { return new Derived129() };
let foobbo129: (p: Base129, n?: number) => Base129 = (p: Base129, n?: number) => { return new Base129() };
let foobdo129: (p: Base129, n?: number) => Derived129 = (p: Base129, n?: number) => { return new Derived129() };
let foodbo129: (p: Derived129, n?: number) => Base129 = (p: Derived129, n?: number) => { return new Base129() };
let fooddo129: (p: Derived129, n?: number) => Derived129 = (p: Derived129, n?: number) => { return new Derived129() };
let foobbr129: (p: Base129, ...n: number[]) => Base129 = (p: Base129, ...n: number[]) => { return new Base129() };
let foobdr129: (p: Base129, ...n: number[]) => Derived129 = (p: Base129, ...n: number[]) => { return new Derived129() };
let foodbr129: (p: Derived129, ...n: number[]) => Base129 = (p: Derived129, ...n: number[]) => { return new Base129() };
let fooddr129: (p: Derived129, ...n: number[]) => Derived129 = (p: Derived129, ...n: number[]) => { return new Derived129() };
foodbn129 = foobdn129


class Base130 {
  b: string = 'b'
}
class Derived130 extends Base130 {
  b: string = 'd'
}
let foobb130: (p: Base130) => Base130 = (p: Base130) => { return new Base130 }
let foobd130: (p: Base130) => Derived130 = (p: Base130) => { return new Derived130 }
let foodb130: (p: Derived130) => Base130 = (p: Derived130) => { return new Base130 }
let foodd130: (p: Derived130) => Derived130 = (p: Derived130) => { return new Derived130 }
let foobbn130: (p: Base130, n: number) => Base130 = (p: Base130, n: number) => { return new Base130() };
let foobdn130: (p: Base130, n: number) => Derived130 = (p: Base130, n: number) => { return new Derived130() };
let foodbn130: (p: Derived130, n: number) => Base130 = (p: Derived130, n: number) => { return new Base130() };
let fooddn130: (p: Derived130, n: number) => Derived130 = (p: Derived130, n: number) => { return new Derived130() };
let foobbo130: (p: Base130, n?: number) => Base130 = (p: Base130, n?: number) => { return new Base130() };
let foobdo130: (p: Base130, n?: number) => Derived130 = (p: Base130, n?: number) => { return new Derived130() };
let foodbo130: (p: Derived130, n?: number) => Base130 = (p: Derived130, n?: number) => { return new Base130() };
let fooddo130: (p: Derived130, n?: number) => Derived130 = (p: Derived130, n?: number) => { return new Derived130() };
let foobbr130: (p: Base130, ...n: number[]) => Base130 = (p: Base130, ...n: number[]) => { return new Base130() };
let foobdr130: (p: Base130, ...n: number[]) => Derived130 = (p: Base130, ...n: number[]) => { return new Derived130() };
let foodbr130: (p: Derived130, ...n: number[]) => Base130 = (p: Derived130, ...n: number[]) => { return new Base130() };
let fooddr130: (p: Derived130, ...n: number[]) => Derived130 = (p: Derived130, ...n: number[]) => { return new Derived130() };
foodbo130 = foobdo130


class Base131 {
  b: string = 'b'
}
class Derived131 extends Base131 {
  b: string = 'd'
}
let foobb131: (p: Base131) => Base131 = (p: Base131) => { return new Base131 }
let foobd131: (p: Base131) => Derived131 = (p: Base131) => { return new Derived131 }
let foodb131: (p: Derived131) => Base131 = (p: Derived131) => { return new Base131 }
let foodd131: (p: Derived131) => Derived131 = (p: Derived131) => { return new Derived131 }
let foobbn131: (p: Base131, n: number) => Base131 = (p: Base131, n: number) => { return new Base131() };
let foobdn131: (p: Base131, n: number) => Derived131 = (p: Base131, n: number) => { return new Derived131() };
let foodbn131: (p: Derived131, n: number) => Base131 = (p: Derived131, n: number) => { return new Base131() };
let fooddn131: (p: Derived131, n: number) => Derived131 = (p: Derived131, n: number) => { return new Derived131() };
let foobbo131: (p: Base131, n?: number) => Base131 = (p: Base131, n?: number) => { return new Base131() };
let foobdo131: (p: Base131, n?: number) => Derived131 = (p: Base131, n?: number) => { return new Derived131() };
let foodbo131: (p: Derived131, n?: number) => Base131 = (p: Derived131, n?: number) => { return new Base131() };
let fooddo131: (p: Derived131, n?: number) => Derived131 = (p: Derived131, n?: number) => { return new Derived131() };
let foobbr131: (p: Base131, ...n: number[]) => Base131 = (p: Base131, ...n: number[]) => { return new Base131() };
let foobdr131: (p: Base131, ...n: number[]) => Derived131 = (p: Base131, ...n: number[]) => { return new Derived131() };
let foodbr131: (p: Derived131, ...n: number[]) => Base131 = (p: Derived131, ...n: number[]) => { return new Base131() };
let fooddr131: (p: Derived131, ...n: number[]) => Derived131 = (p: Derived131, ...n: number[]) => { return new Derived131() };
foodbr131 = foobdr131


class Base132 {
  b: string = 'b'
}
class Derived132 extends Base132 {
  b: string = 'd'
}
let foobb132: (p: Base132) => Base132 = (p: Base132) => { return new Base132 }
let foobd132: (p: Base132) => Derived132 = (p: Base132) => { return new Derived132 }
let foodb132: (p: Derived132) => Base132 = (p: Derived132) => { return new Base132 }
let foodd132: (p: Derived132) => Derived132 = (p: Derived132) => { return new Derived132 }
let foobbn132: (p: Base132, n: number) => Base132 = (p: Base132, n: number) => { return new Base132() };
let foobdn132: (p: Base132, n: number) => Derived132 = (p: Base132, n: number) => { return new Derived132() };
let foodbn132: (p: Derived132, n: number) => Base132 = (p: Derived132, n: number) => { return new Base132() };
let fooddn132: (p: Derived132, n: number) => Derived132 = (p: Derived132, n: number) => { return new Derived132() };
let foobbo132: (p: Base132, n?: number) => Base132 = (p: Base132, n?: number) => { return new Base132() };
let foobdo132: (p: Base132, n?: number) => Derived132 = (p: Base132, n?: number) => { return new Derived132() };
let foodbo132: (p: Derived132, n?: number) => Base132 = (p: Derived132, n?: number) => { return new Base132() };
let fooddo132: (p: Derived132, n?: number) => Derived132 = (p: Derived132, n?: number) => { return new Derived132() };
let foobbr132: (p: Base132, ...n: number[]) => Base132 = (p: Base132, ...n: number[]) => { return new Base132() };
let foobdr132: (p: Base132, ...n: number[]) => Derived132 = (p: Base132, ...n: number[]) => { return new Derived132() };
let foodbr132: (p: Derived132, ...n: number[]) => Base132 = (p: Derived132, ...n: number[]) => { return new Base132() };
let fooddr132: (p: Derived132, ...n: number[]) => Derived132 = (p: Derived132, ...n: number[]) => { return new Derived132() };
foodbn132 = foobbn132


class Base133 {
  b: string = 'b'
}
class Derived133 extends Base133 {
  b: string = 'd'
}
let foobb133: (p: Base133) => Base133 = (p: Base133) => { return new Base133 }
let foobd133: (p: Base133) => Derived133 = (p: Base133) => { return new Derived133 }
let foodb133: (p: Derived133) => Base133 = (p: Derived133) => { return new Base133 }
let foodd133: (p: Derived133) => Derived133 = (p: Derived133) => { return new Derived133 }
let foobbn133: (p: Base133, n: number) => Base133 = (p: Base133, n: number) => { return new Base133() };
let foobdn133: (p: Base133, n: number) => Derived133 = (p: Base133, n: number) => { return new Derived133() };
let foodbn133: (p: Derived133, n: number) => Base133 = (p: Derived133, n: number) => { return new Base133() };
let fooddn133: (p: Derived133, n: number) => Derived133 = (p: Derived133, n: number) => { return new Derived133() };
let foobbo133: (p: Base133, n?: number) => Base133 = (p: Base133, n?: number) => { return new Base133() };
let foobdo133: (p: Base133, n?: number) => Derived133 = (p: Base133, n?: number) => { return new Derived133() };
let foodbo133: (p: Derived133, n?: number) => Base133 = (p: Derived133, n?: number) => { return new Base133() };
let fooddo133: (p: Derived133, n?: number) => Derived133 = (p: Derived133, n?: number) => { return new Derived133() };
let foobbr133: (p: Base133, ...n: number[]) => Base133 = (p: Base133, ...n: number[]) => { return new Base133() };
let foobdr133: (p: Base133, ...n: number[]) => Derived133 = (p: Base133, ...n: number[]) => { return new Derived133() };
let foodbr133: (p: Derived133, ...n: number[]) => Base133 = (p: Derived133, ...n: number[]) => { return new Base133() };
let fooddr133: (p: Derived133, ...n: number[]) => Derived133 = (p: Derived133, ...n: number[]) => { return new Derived133() };
foodbo133 = foobbo133


class Base134 {
  b: string = 'b'
}
class Derived134 extends Base134 {
  b: string = 'd'
}
let foobb134: (p: Base134) => Base134 = (p: Base134) => { return new Base134 }
let foobd134: (p: Base134) => Derived134 = (p: Base134) => { return new Derived134 }
let foodb134: (p: Derived134) => Base134 = (p: Derived134) => { return new Base134 }
let foodd134: (p: Derived134) => Derived134 = (p: Derived134) => { return new Derived134 }
let foobbn134: (p: Base134, n: number) => Base134 = (p: Base134, n: number) => { return new Base134() };
let foobdn134: (p: Base134, n: number) => Derived134 = (p: Base134, n: number) => { return new Derived134() };
let foodbn134: (p: Derived134, n: number) => Base134 = (p: Derived134, n: number) => { return new Base134() };
let fooddn134: (p: Derived134, n: number) => Derived134 = (p: Derived134, n: number) => { return new Derived134() };
let foobbo134: (p: Base134, n?: number) => Base134 = (p: Base134, n?: number) => { return new Base134() };
let foobdo134: (p: Base134, n?: number) => Derived134 = (p: Base134, n?: number) => { return new Derived134() };
let foodbo134: (p: Derived134, n?: number) => Base134 = (p: Derived134, n?: number) => { return new Base134() };
let fooddo134: (p: Derived134, n?: number) => Derived134 = (p: Derived134, n?: number) => { return new Derived134() };
let foobbr134: (p: Base134, ...n: number[]) => Base134 = (p: Base134, ...n: number[]) => { return new Base134() };
let foobdr134: (p: Base134, ...n: number[]) => Derived134 = (p: Base134, ...n: number[]) => { return new Derived134() };
let foodbr134: (p: Derived134, ...n: number[]) => Base134 = (p: Derived134, ...n: number[]) => { return new Base134() };
let fooddr134: (p: Derived134, ...n: number[]) => Derived134 = (p: Derived134, ...n: number[]) => { return new Derived134() };
foodbr134 = foobbr134


class Base135 {
  b: string = 'b'
}
class Derived135 extends Base135 {
  b: string = 'd'
}
class C135 {
  static fooBB135(p: Base135): Base135 {return p};
  static fooBD135(p: Base135): Derived135 {return new Derived135()};
  static fooDB135(p: Derived135): Base135 { return new Base135()};
  static fooDD135(p: Derived135): Derived135 { return p};
  static fooBBN135(p: Base135, n: number): Base135 {return p};
  static fooBDN135(p: Base135, n: number): Derived135 {return new Derived135()};
  static fooDBN135(p: Derived135, n: number): Base135 { return new Base135()};
  static fooDDN135(p: Derived135, n: number): Derived135 { return p};
  static fooBBO135(p: Base135, n?: number): Base135 {return p};
  static fooBDO135(p: Base135, n?: number): Derived135 {return new Derived135()};
  static fooDBO135(p: Derived135, n?: number): Base135 { return new Base135()};
  static fooDDO135(p: Derived135, n?: number): Derived135 { return p};
  static fooBBR135(p: Base135, ...n: number[]): Base135 {return p};
  static fooBDR135(p: Base135, ...n: number[]): Derived135 {return new Derived135()};
  static fooDBR135(p: Derived135, ...n: number[]): Base135 { return new Base135()};
  static fooDDR135(p: Derived135, ...n: number[]): Derived135 { return p};
}
let foobb135 = C135.fooBB135
let foobd135 = C135.fooBD135
let foodb135 = C135.fooDB135
let foodd135 = C135.fooDD135
let foobbn135 = C135.fooBBN135
let foobdn135 = C135.fooBDN135
let foodbn135 = C135.fooDBN135
let fooddn135 = C135.fooDDN135
let foobbo135 = C135.fooBBO135
let foobdo135 = C135.fooBDO135
let foodbo135 = C135.fooDBO135
let fooddo135 = C135.fooDDO135
let foobbr135 = C135.fooBBR135
let foobdr135 = C135.fooBDR135
let foodbr135 = C135.fooDBR135
let fooddr135 = C135.fooDDR135
foobb135 = foobd135


class Base136 {
  b: string = 'b'
}
class Derived136 extends Base136 {
  b: string = 'd'
}
class C136 {
  static fooBB136(p: Base136): Base136 {return p};
  static fooBD136(p: Base136): Derived136 {return new Derived136()};
  static fooDB136(p: Derived136): Base136 { return new Base136()};
  static fooDD136(p: Derived136): Derived136 { return p};
  static fooBBN136(p: Base136, n: number): Base136 {return p};
  static fooBDN136(p: Base136, n: number): Derived136 {return new Derived136()};
  static fooDBN136(p: Derived136, n: number): Base136 { return new Base136()};
  static fooDDN136(p: Derived136, n: number): Derived136 { return p};
  static fooBBO136(p: Base136, n?: number): Base136 {return p};
  static fooBDO136(p: Base136, n?: number): Derived136 {return new Derived136()};
  static fooDBO136(p: Derived136, n?: number): Base136 { return new Base136()};
  static fooDDO136(p: Derived136, n?: number): Derived136 { return p};
  static fooBBR136(p: Base136, ...n: number[]): Base136 {return p};
  static fooBDR136(p: Base136, ...n: number[]): Derived136 {return new Derived136()};
  static fooDBR136(p: Derived136, ...n: number[]): Base136 { return new Base136()};
  static fooDDR136(p: Derived136, ...n: number[]): Derived136 { return p};
}
let foobb136 = C136.fooBB136
let foobd136 = C136.fooBD136
let foodb136 = C136.fooDB136
let foodd136 = C136.fooDD136
let foobbn136 = C136.fooBBN136
let foobdn136 = C136.fooBDN136
let foodbn136 = C136.fooDBN136
let fooddn136 = C136.fooDDN136
let foobbo136 = C136.fooBBO136
let foobdo136 = C136.fooBDO136
let foodbo136 = C136.fooDBO136
let fooddo136 = C136.fooDDO136
let foobbr136 = C136.fooBBR136
let foobdr136 = C136.fooBDR136
let foodbr136 = C136.fooDBR136
let fooddr136 = C136.fooDDR136
foodb136 = foobd136

export default function SubtypingForFunctionTypesTest05(): void {
  describe('SubtypingForFunctionTypesTest05', () => {
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
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_1500
     * @tc.name      testPositiveInterfaceMethodGeneric0114
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
    it("testPositiveInterfaceMethodGeneric0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0114';

      let r = foodbo114.unsafeCall(new Base114)
      expect(r instanceof Base114).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_1600
     * @tc.name      testPositiveInterfaceMethodGeneric0115
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
    it("testPositiveInterfaceMethodGeneric0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethodGeneric0115';

      let r = foodbr115.unsafeCall(new Base115, 1.0, 2.0, 3.0)
      expect(r instanceof Base115).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_1700
     * @tc.name      testPositiveLambda0116
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0116';

      expect(foobb116(new Base116) instanceof Derived116).assertTrue()
      expect(foobb116(new Base116).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_1800
     * @tc.name      testPositiveLambda0117
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0117';

      let r = foodb117.unsafeCall(new Base117)
      expect(r instanceof Derived117).assertTrue()
      expect((r as Base117).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_1900
     * @tc.name      testPositiveLambda0118
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0118';

      expect(foodb118(new Derived118) instanceof Derived118).assertTrue()
      expect(foodb118(new Derived118).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_2000
     * @tc.name      testPositiveLambda0119
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0119';

      let r = foodd119.unsafeCall(new Base119)
      expect(r instanceof Derived119).assertTrue()
      expect((r as Base119).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_2100
     * @tc.name      testPositiveLambda0120
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0120';

      expect(foobbn120(new Base120, 1) instanceof Base120).assertTrue()
      expect(foobbn120(new Base120, 1).b).assertEqual('b')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_2200
     * @tc.name      testPositiveLambda0121
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0121';

      expect(foobbo121(new Base121) instanceof Base121).assertTrue()
      expect(foobbo121(new Base121).b).assertEqual('b')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_2300
     * @tc.name      testPositiveLambda0122
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0122';

      expect(foobbn122(new Base122, 1) instanceof Derived122).assertTrue()
      expect(foobbn122(new Base122, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_2400
     * @tc.name      testPositiveLambda0123
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0123';

      expect(foobbo123(new Base123) instanceof Derived123).assertTrue()
      expect(foobbo123(new Base123).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_2500
     * @tc.name      testPositiveLambda0124
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0124';

      expect(foodbn124(new Derived124, 1) instanceof Derived124).assertTrue()
      expect(foodbn124(new Derived124, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_2600
     * @tc.name      testPositiveLambda0125
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0125';

      expect(foodbo125(new Derived125) instanceof Derived125).assertTrue()
      expect(foodbo125(new Derived125).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_2700
     * @tc.name      testPositiveLambda0126
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0126';

      expect(foodbn126(new Derived126, 1) instanceof Derived126).assertTrue()
      expect(foodbn126(new Derived126, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_2800
     * @tc.name      testPositiveLambda0127
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0127';

      expect(foodbo127(new Derived127) instanceof Derived127).assertTrue()
      expect(foodbo127(new Derived127).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_2900
     * @tc.name      testPositiveLambda0128
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0128';

      expect(foodbr128(new Derived128, 1, 2, 3) instanceof Derived128).assertTrue()
      expect(foodbr128(new Derived128, 1, 2, 3).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_3000
     * @tc.name      testPositiveLambda0129
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2014 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0129';

      expect(foodbn129(new Derived129, 1) instanceof Derived129).assertTrue()
      expect(foodbn129(new Derived129, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_3100
     * @tc.name      testPositiveLambda0130
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2014 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0130';

      expect(foodbo130(new Derived130) instanceof Derived130).assertTrue()
      expect(foodbo130(new Derived130).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_3200
     * @tc.name      testPositiveLambda0131
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2014 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0131';

      expect(foodbr131(new Derived131, 1, 2, 3) instanceof Derived131).assertTrue()
      expect(foodbr131(new Derived131, 1, 2, 3).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_3300
     * @tc.name      testPositiveLambda0132
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2014 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0132';

      let r = foodbn132.unsafeCall(new Base132, 1.0)

      expect(r instanceof Base132).assertTrue()
      expect((r as Base132).b).assertEqual('b')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_3400
     * @tc.name      testPositiveLambda0133
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2014 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0133';


      let r = foodbo133.unsafeCall(new Base133)

      expect(r instanceof Base133).assertTrue()
      expect((r as Base133).b).assertEqual('b')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_3500
     * @tc.name      testPositiveLambda0134
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2014 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveLambda0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveLambda0134';

      let r = foodbr134.unsafeCall(new Base134, 1.0, 2.0, 3.0)
      expect(r instanceof Base134).assertTrue()
      expect((r as Base134).b).assertEqual('b')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_3600
     * @tc.name      testPositiveStaticMethod0135
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveStaticMethod0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0135';

      expect(foobb135(new Base135) instanceof Derived135).assertTrue()
      expect(foobb135(new Base135).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_3700
     * @tc.name      testPositiveStaticMethod0136
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveStaticMethod0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0136';

      let r = foodb136.unsafeCall(new Base136)
      expect(r instanceof Derived136).assertTrue()
      expect((r as Base136).b).assertEqual('d')
    });
  })
}