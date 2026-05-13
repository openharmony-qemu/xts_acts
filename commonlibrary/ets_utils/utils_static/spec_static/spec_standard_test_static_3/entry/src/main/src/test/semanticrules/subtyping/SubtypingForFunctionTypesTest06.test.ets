import {
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType
} from '../../../../../hypium/index';

class Base137 {
  b: string = 'b'
}
class Derived137 extends Base137 {
  b: string = 'd'
}
class C137 {
  static fooBB137(p: Base137): Base137 {return p};
  static fooBD137(p: Base137): Derived137 {return new Derived137()};
  static fooDB137(p: Derived137): Base137 { return new Base137()};
  static fooDD137(p: Derived137): Derived137 { return p};
  static fooBBN137(p: Base137, n: number): Base137 {return p};
  static fooBDN137(p: Base137, n: number): Derived137 {return new Derived137()};
  static fooDBN137(p: Derived137, n: number): Base137 { return new Base137()};
  static fooDDN137(p: Derived137, n: number): Derived137 { return p};
  static fooBBO137(p: Base137, n?: number): Base137 {return p};
  static fooBDO137(p: Base137, n?: number): Derived137 {return new Derived137()};
  static fooDBO137(p: Derived137, n?: number): Base137 { return new Base137()};
  static fooDDO137(p: Derived137, n?: number): Derived137 { return p};
  static fooBBR137(p: Base137, ...n: number[]): Base137 {return p};
  static fooBDR137(p: Base137, ...n: number[]): Derived137 {return new Derived137()};
  static fooDBR137(p: Derived137, ...n: number[]): Base137 { return new Base137()};
  static fooDDR137(p: Derived137, ...n: number[]): Derived137 { return p};
}
let foobb137 = C137.fooBB137
let foobd137 = C137.fooBD137
let foodb137 = C137.fooDB137
let foodd137 = C137.fooDD137
let foobbn137 = C137.fooBBN137
let foobdn137 = C137.fooBDN137
let foodbn137 = C137.fooDBN137
let fooddn137 = C137.fooDDN137
let foobbo137 = C137.fooBBO137
let foobdo137 = C137.fooBDO137
let foodbo137 = C137.fooDBO137
let fooddo137 = C137.fooDDO137
let foobbr137 = C137.fooBBR137
let foobdr137 = C137.fooBDR137
let foodbr137 = C137.fooDBR137
let fooddr137 = C137.fooDDR137
foodb137 = foodd137


class Base138 {
  b: string = 'b'
}
class Derived138 extends Base138 {
  b: string = 'd'
}
class C138 {
  static fooBB138(p: Base138): Base138 {return p};
  static fooBD138(p: Base138): Derived138 {return new Derived138()};
  static fooDB138(p: Derived138): Base138 { return new Base138()};
  static fooDD138(p: Derived138): Derived138 { return p};
  static fooBBN138(p: Base138, n: number): Base138 {return p};
  static fooBDN138(p: Base138, n: number): Derived138 {return new Derived138()};
  static fooDBN138(p: Derived138, n: number): Base138 { return new Base138()};
  static fooDDN138(p: Derived138, n: number): Derived138 { return p};
  static fooBBO138(p: Base138, n?: number): Base138 {return p};
  static fooBDO138(p: Base138, n?: number): Derived138 {return new Derived138()};
  static fooDBO138(p: Derived138, n?: number): Base138 { return new Base138()};
  static fooDDO138(p: Derived138, n?: number): Derived138 { return p};
  static fooBBR138(p: Base138, ...n: number[]): Base138 {return p};
  static fooBDR138(p: Base138, ...n: number[]): Derived138 {return new Derived138()};
  static fooDBR138(p: Derived138, ...n: number[]): Base138 { return new Base138()};
  static fooDDR138(p: Derived138, ...n: number[]): Derived138 { return p};
}
let foobb138 = C138.fooBB138
let foobd138 = C138.fooBD138
let foodb138 = C138.fooDB138
let foodd138 = C138.fooDD138
let foobbn138 = C138.fooBBN138
let foobdn138 = C138.fooBDN138
let foodbn138 = C138.fooDBN138
let fooddn138 = C138.fooDDN138
let foobbo138 = C138.fooBBO138
let foobdo138 = C138.fooBDO138
let foodbo138 = C138.fooDBO138
let fooddo138 = C138.fooDDO138
let foobbr138 = C138.fooBBR138
let foobdr138 = C138.fooBDR138
let foodbr138 = C138.fooDBR138
let fooddr138 = C138.fooDDR138
foodd138 = foobd138


class Base139 {
  b: string = 'b'
}
class Derived139 extends Base139 {
  b: string = 'd'
}
class C139 {
  static fooBB139(p: Base139): Base139 {return p};
  static fooBD139(p: Base139): Derived139 {return new Derived139()};
  static fooDB139(p: Derived139): Base139 { return new Base139()};
  static fooDD139(p: Derived139): Derived139 { return p};
  static fooBBN139(p: Base139, n: number): Base139 {return p};
  static fooBDN139(p: Base139, n: number): Derived139 {return new Derived139()};
  static fooDBN139(p: Derived139, n: number): Base139 { return new Base139()};
  static fooDDN139(p: Derived139, n: number): Derived139 { return p};
  static fooBBO139(p: Base139, n?: number): Base139 {return p};
  static fooBDO139(p: Base139, n?: number): Derived139 {return new Derived139()};
  static fooDBO139(p: Derived139, n?: number): Base139 { return new Base139()};
  static fooDDO139(p: Derived139, n?: number): Derived139 { return p};
  static fooBBR139(p: Base139, ...n: number[]): Base139 {return p};
  static fooBDR139(p: Base139, ...n: number[]): Derived139 {return new Derived139()};
  static fooDBR139(p: Derived139, ...n: number[]): Base139 { return new Base139()};
  static fooDDR139(p: Derived139, ...n: number[]): Derived139 { return p};
}
let foobb139 = C139.fooBB139
let foobd139 = C139.fooBD139
let foodb139 = C139.fooDB139
let foodd139 = C139.fooDD139
let foobbn139 = C139.fooBBN139
let foobdn139 = C139.fooBDN139
let foodbn139 = C139.fooDBN139
let fooddn139 = C139.fooDDN139
let foobbo139 = C139.fooBBO139
let foobdo139 = C139.fooBDO139
let foodbo139 = C139.fooDBO139
let fooddo139 = C139.fooDDO139
let foobbr139 = C139.fooBBR139
let foobdr139 = C139.fooBDR139
let foodbr139 = C139.fooDBR139
let fooddr139 = C139.fooDDR139
foobbn139 = foobb139


class Base140 {
  b: string = 'b'
}
class Derived140 extends Base140 {
  b: string = 'd'
}
class C140 {
  static fooBB140(p: Base140): Base140 {return p};
  static fooBD140(p: Base140): Derived140 {return new Derived140()};
  static fooDB140(p: Derived140): Base140 { return new Base140()};
  static fooDD140(p: Derived140): Derived140 { return p};
  static fooBBN140(p: Base140, n: number): Base140 {return p};
  static fooBDN140(p: Base140, n: number): Derived140 {return new Derived140()};
  static fooDBN140(p: Derived140, n: number): Base140 { return new Base140()};
  static fooDDN140(p: Derived140, n: number): Derived140 { return p};
  static fooBBO140(p: Base140, n?: number): Base140 {return p};
  static fooBDO140(p: Base140, n?: number): Derived140 {return new Derived140()};
  static fooDBO140(p: Derived140, n?: number): Base140 { return new Base140()};
  static fooDDO140(p: Derived140, n?: number): Derived140 { return p};
  static fooBBR140(p: Base140, ...n: number[]): Base140 {return p};
  static fooBDR140(p: Base140, ...n: number[]): Derived140 {return new Derived140()};
  static fooDBR140(p: Derived140, ...n: number[]): Base140 { return new Base140()};
  static fooDDR140(p: Derived140, ...n: number[]): Derived140 { return p};
}
let foobb140 = C140.fooBB140
let foobd140 = C140.fooBD140
let foodb140 = C140.fooDB140
let foodd140 = C140.fooDD140
let foobbn140 = C140.fooBBN140
let foobdn140 = C140.fooBDN140
let foodbn140 = C140.fooDBN140
let fooddn140 = C140.fooDDN140
let foobbo140 = C140.fooBBO140
let foobdo140 = C140.fooBDO140
let foodbo140 = C140.fooDBO140
let fooddo140 = C140.fooDDO140
let foobbr140 = C140.fooBBR140
let foobdr140 = C140.fooBDR140
let foodbr140 = C140.fooDBR140
let fooddr140 = C140.fooDDR140
foobbo140 = foobb140


class Base141 {
  b: string = 'b'
}
class Derived141 extends Base141 {
  b: string = 'd'
}
class C141 {
  static fooBB141(p: Base141): Base141 {return p};
  static fooBD141(p: Base141): Derived141 {return new Derived141()};
  static fooDB141(p: Derived141): Base141 { return new Base141()};
  static fooDD141(p: Derived141): Derived141 { return p};
  static fooBBN141(p: Base141, n: number): Base141 {return p};
  static fooBDN141(p: Base141, n: number): Derived141 {return new Derived141()};
  static fooDBN141(p: Derived141, n: number): Base141 { return new Base141()};
  static fooDDN141(p: Derived141, n: number): Derived141 { return p};
  static fooBBO141(p: Base141, n?: number): Base141 {return p};
  static fooBDO141(p: Base141, n?: number): Derived141 {return new Derived141()};
  static fooDBO141(p: Derived141, n?: number): Base141 { return new Base141()};
  static fooDDO141(p: Derived141, n?: number): Derived141 { return p};
  static fooBBR141(p: Base141, ...n: number[]): Base141 {return p};
  static fooBDR141(p: Base141, ...n: number[]): Derived141 {return new Derived141()};
  static fooDBR141(p: Derived141, ...n: number[]): Base141 { return new Base141()};
  static fooDDR141(p: Derived141, ...n: number[]): Derived141 { return p};
}
let foobb141 = C141.fooBB141
let foobd141 = C141.fooBD141
let foodb141 = C141.fooDB141
let foodd141 = C141.fooDD141
let foobbn141 = C141.fooBBN141
let foobdn141 = C141.fooBDN141
let foodbn141 = C141.fooDBN141
let fooddn141 = C141.fooDDN141
let foobbo141 = C141.fooBBO141
let foobdo141 = C141.fooBDO141
let foodbo141 = C141.fooDBO141
let fooddo141 = C141.fooDDO141
let foobbr141 = C141.fooBBR141
let foobdr141 = C141.fooBDR141
let foodbr141 = C141.fooDBR141
let fooddr141 = C141.fooDDR141
foobbn141 = foobd141


class Base142 {
  b: string = 'b'
}
class Derived142 extends Base142 {
  b: string = 'd'
}
class C142 {
  static fooBB142(p: Base142): Base142 {return p};
  static fooBD142(p: Base142): Derived142 {return new Derived142()};
  static fooDB142(p: Derived142): Base142 { return new Base142()};
  static fooDD142(p: Derived142): Derived142 { return p};
  static fooBBN142(p: Base142, n: number): Base142 {return p};
  static fooBDN142(p: Base142, n: number): Derived142 {return new Derived142()};
  static fooDBN142(p: Derived142, n: number): Base142 { return new Base142()};
  static fooDDN142(p: Derived142, n: number): Derived142 { return p};
  static fooBBO142(p: Base142, n?: number): Base142 {return p};
  static fooBDO142(p: Base142, n?: number): Derived142 {return new Derived142()};
  static fooDBO142(p: Derived142, n?: number): Base142 { return new Base142()};
  static fooDDO142(p: Derived142, n?: number): Derived142 { return p};
  static fooBBR142(p: Base142, ...n: number[]): Base142 {return p};
  static fooBDR142(p: Base142, ...n: number[]): Derived142 {return new Derived142()};
  static fooDBR142(p: Derived142, ...n: number[]): Base142 { return new Base142()};
  static fooDDR142(p: Derived142, ...n: number[]): Derived142 { return p};
}
let foobb142 = C142.fooBB142
let foobd142 = C142.fooBD142
let foodb142 = C142.fooDB142
let foodd142 = C142.fooDD142
let foobbn142 = C142.fooBBN142
let foobdn142 = C142.fooBDN142
let foodbn142 = C142.fooDBN142
let fooddn142 = C142.fooDDN142
let foobbo142 = C142.fooBBO142
let foobdo142 = C142.fooBDO142
let foodbo142 = C142.fooDBO142
let fooddo142 = C142.fooDDO142
let foobbr142 = C142.fooBBR142
let foobdr142 = C142.fooBDR142
let foodbr142 = C142.fooDBR142
let fooddr142 = C142.fooDDR142
foobbo142 = foobd142


class Base143 {
  b: string = 'b'
}
class Derived143 extends Base143 {
  b: string = 'd'
}
class C143 {
  static fooBB143(p: Base143): Base143 {return p};
  static fooBD143(p: Base143): Derived143 {return new Derived143()};
  static fooDB143(p: Derived143): Base143 { return new Base143()};
  static fooDD143(p: Derived143): Derived143 { return p};
  static fooBBN143(p: Base143, n: number): Base143 {return p};
  static fooBDN143(p: Base143, n: number): Derived143 {return new Derived143()};
  static fooDBN143(p: Derived143, n: number): Base143 { return new Base143()};
  static fooDDN143(p: Derived143, n: number): Derived143 { return p};
  static fooBBO143(p: Base143, n?: number): Base143 {return p};
  static fooBDO143(p: Base143, n?: number): Derived143 {return new Derived143()};
  static fooDBO143(p: Derived143, n?: number): Base143 { return new Base143()};
  static fooDDO143(p: Derived143, n?: number): Derived143 { return p};
  static fooBBR143(p: Base143, ...n: number[]): Base143 {return p};
  static fooBDR143(p: Base143, ...n: number[]): Derived143 {return new Derived143()};
  static fooDBR143(p: Derived143, ...n: number[]): Base143 { return new Base143()};
  static fooDDR143(p: Derived143, ...n: number[]): Derived143 { return p};
}
let foobb143 = C143.fooBB143
let foobd143 = C143.fooBD143
let foodb143 = C143.fooDB143
let foodd143 = C143.fooDD143
let foobbn143 = C143.fooBBN143
let foobdn143 = C143.fooBDN143
let foodbn143 = C143.fooDBN143
let fooddn143 = C143.fooDDN143
let foobbo143 = C143.fooBBO143
let foobdo143 = C143.fooBDO143
let foodbo143 = C143.fooDBO143
let fooddo143 = C143.fooDDO143
let foobbr143 = C143.fooBBR143
let foobdr143 = C143.fooBDR143
let foodbr143 = C143.fooDBR143
let fooddr143 = C143.fooDDR143
foodbn143 = foobd143


class Base144 {
  b: string = 'b'
}
class Derived144 extends Base144 {
  b: string = 'd'
}
class C144 {
  static fooBB144(p: Base144): Base144 {return p};
  static fooBD144(p: Base144): Derived144 {return new Derived144()};
  static fooDB144(p: Derived144): Base144 { return new Base144()};
  static fooDD144(p: Derived144): Derived144 { return p};
  static fooBBN144(p: Base144, n: number): Base144 {return p};
  static fooBDN144(p: Base144, n: number): Derived144 {return new Derived144()};
  static fooDBN144(p: Derived144, n: number): Base144 { return new Base144()};
  static fooDDN144(p: Derived144, n: number): Derived144 { return p};
  static fooBBO144(p: Base144, n?: number): Base144 {return p};
  static fooBDO144(p: Base144, n?: number): Derived144 {return new Derived144()};
  static fooDBO144(p: Derived144, n?: number): Base144 { return new Base144()};
  static fooDDO144(p: Derived144, n?: number): Derived144 { return p};
  static fooBBR144(p: Base144, ...n: number[]): Base144 {return p};
  static fooBDR144(p: Base144, ...n: number[]): Derived144 {return new Derived144()};
  static fooDBR144(p: Derived144, ...n: number[]): Base144 { return new Base144()};
  static fooDDR144(p: Derived144, ...n: number[]): Derived144 { return p};
}
let foobb144 = C144.fooBB144
let foobd144 = C144.fooBD144
let foodb144 = C144.fooDB144
let foodd144 = C144.fooDD144
let foobbn144 = C144.fooBBN144
let foobdn144 = C144.fooBDN144
let foodbn144 = C144.fooDBN144
let fooddn144 = C144.fooDDN144
let foobbo144 = C144.fooBBO144
let foobdo144 = C144.fooBDO144
let foodbo144 = C144.fooDBO144
let fooddo144 = C144.fooDDO144
let foobbr144 = C144.fooBBR144
let foobdr144 = C144.fooBDR144
let foodbr144 = C144.fooDBR144
let fooddr144 = C144.fooDDR144
foodbo144 = foobd144


class Base145 {
  b: string = 'b'
}
class Derived145 extends Base145 {
  b: string = 'd'
}
class C145 {
  static fooBB145(p: Base145): Base145 {return p};
  static fooBD145(p: Base145): Derived145 {return new Derived145()};
  static fooDB145(p: Derived145): Base145 { return new Base145()};
  static fooDD145(p: Derived145): Derived145 { return p};
  static fooBBN145(p: Base145, n: number): Base145 {return p};
  static fooBDN145(p: Base145, n: number): Derived145 {return new Derived145()};
  static fooDBN145(p: Derived145, n: number): Base145 { return new Base145()};
  static fooDDN145(p: Derived145, n: number): Derived145 { return p};
  static fooBBO145(p: Base145, n?: number): Base145 {return p};
  static fooBDO145(p: Base145, n?: number): Derived145 {return new Derived145()};
  static fooDBO145(p: Derived145, n?: number): Base145 { return new Base145()};
  static fooDDO145(p: Derived145, n?: number): Derived145 { return p};
  static fooBBR145(p: Base145, ...n: number[]): Base145 {return p};
  static fooBDR145(p: Base145, ...n: number[]): Derived145 {return new Derived145()};
  static fooDBR145(p: Derived145, ...n: number[]): Base145 { return new Base145()};
  static fooDDR145(p: Derived145, ...n: number[]): Derived145 { return p};
}
let foobb145 = C145.fooBB145
let foobd145 = C145.fooBD145
let foodb145 = C145.fooDB145
let foodd145 = C145.fooDD145
let foobbn145 = C145.fooBBN145
let foobdn145 = C145.fooBDN145
let foodbn145 = C145.fooDBN145
let fooddn145 = C145.fooDDN145
let foobbo145 = C145.fooBBO145
let foobdo145 = C145.fooBDO145
let foodbo145 = C145.fooDBO145
let fooddo145 = C145.fooDDO145
let foobbr145 = C145.fooBBR145
let foobdr145 = C145.fooBDR145
let foodbr145 = C145.fooDBR145
let fooddr145 = C145.fooDDR145
foodbn145 = fooddn145


class Base146 {
  b: string = 'b'
}
class Derived146 extends Base146 {
  b: string = 'd'
}
class C146 {
  static fooBB146(p: Base146): Base146 {return p};
  static fooBD146(p: Base146): Derived146 {return new Derived146()};
  static fooDB146(p: Derived146): Base146 { return new Base146()};
  static fooDD146(p: Derived146): Derived146 { return p};
  static fooBBN146(p: Base146, n: number): Base146 {return p};
  static fooBDN146(p: Base146, n: number): Derived146 {return new Derived146()};
  static fooDBN146(p: Derived146, n: number): Base146 { return new Base146()};
  static fooDDN146(p: Derived146, n: number): Derived146 { return p};
  static fooBBO146(p: Base146, n?: number): Base146 {return p};
  static fooBDO146(p: Base146, n?: number): Derived146 {return new Derived146()};
  static fooDBO146(p: Derived146, n?: number): Base146 { return new Base146()};
  static fooDDO146(p: Derived146, n?: number): Derived146 { return p};
  static fooBBR146(p: Base146, ...n: number[]): Base146 {return p};
  static fooBDR146(p: Base146, ...n: number[]): Derived146 {return new Derived146()};
  static fooDBR146(p: Derived146, ...n: number[]): Base146 { return new Base146()};
  static fooDDR146(p: Derived146, ...n: number[]): Derived146 { return p};
}
let foobb146 = C146.fooBB146
let foobd146 = C146.fooBD146
let foodb146 = C146.fooDB146
let foodd146 = C146.fooDD146
let foobbn146 = C146.fooBBN146
let foobdn146 = C146.fooBDN146
let foodbn146 = C146.fooDBN146
let fooddn146 = C146.fooDDN146
let foobbo146 = C146.fooBBO146
let foobdo146 = C146.fooBDO146
let foodbo146 = C146.fooDBO146
let fooddo146 = C146.fooDDO146
let foobbr146 = C146.fooBBR146
let foobdr146 = C146.fooBDR146
let foodbr146 = C146.fooDBR146
let fooddr146 = C146.fooDDR146
foodbo146 = fooddo146


class Base147 {
  b: string = 'b'
}
class Derived147 extends Base147 {
  b: string = 'd'
}
class C147 {
  static fooBB147(p: Base147): Base147 {return p};
  static fooBD147(p: Base147): Derived147 {return new Derived147()};
  static fooDB147(p: Derived147): Base147 { return new Base147()};
  static fooDD147(p: Derived147): Derived147 { return p};
  static fooBBN147(p: Base147, n: number): Base147 {return p};
  static fooBDN147(p: Base147, n: number): Derived147 {return new Derived147()};
  static fooDBN147(p: Derived147, n: number): Base147 { return new Base147()};
  static fooDDN147(p: Derived147, n: number): Derived147 { return p};
  static fooBBO147(p: Base147, n?: number): Base147 {return p};
  static fooBDO147(p: Base147, n?: number): Derived147 {return new Derived147()};
  static fooDBO147(p: Derived147, n?: number): Base147 { return new Base147()};
  static fooDDO147(p: Derived147, n?: number): Derived147 { return p};
  static fooBBR147(p: Base147, ...n: number[]): Base147 {return p};
  static fooBDR147(p: Base147, ...n: number[]): Derived147 {return new Derived147()};
  static fooDBR147(p: Derived147, ...n: number[]): Base147 { return new Base147()};
  static fooDDR147(p: Derived147, ...n: number[]): Derived147 { return p};
}
let foobb147 = C147.fooBB147
let foobd147 = C147.fooBD147
let foodb147 = C147.fooDB147
let foodd147 = C147.fooDD147
let foobbn147 = C147.fooBBN147
let foobdn147 = C147.fooBDN147
let foodbn147 = C147.fooDBN147
let fooddn147 = C147.fooDDN147
let foobbo147 = C147.fooBBO147
let foobdo147 = C147.fooBDO147
let foodbo147 = C147.fooDBO147
let fooddo147 = C147.fooDDO147
let foobbr147 = C147.fooBBR147
let foobdr147 = C147.fooBDR147
let foodbr147 = C147.fooDBR147
let fooddr147 = C147.fooDDR147
foodbn147 = foobdn147


class Base148 {
  b: string = 'b'
}
class Derived148 extends Base148 {
  b: string = 'd'
}
class C148 {
  static fooBB148(p: Base148): Base148 {return p};
  static fooBD148(p: Base148): Derived148 {return new Derived148()};
  static fooDB148(p: Derived148): Base148 { return new Base148()};
  static fooDD148(p: Derived148): Derived148 { return p};
  static fooBBN148(p: Base148, n: number): Base148 {return p};
  static fooBDN148(p: Base148, n: number): Derived148 {return new Derived148()};
  static fooDBN148(p: Derived148, n: number): Base148 { return new Base148()};
  static fooDDN148(p: Derived148, n: number): Derived148 { return p};
  static fooBBO148(p: Base148, n?: number): Base148 {return p};
  static fooBDO148(p: Base148, n?: number): Derived148 {return new Derived148()};
  static fooDBO148(p: Derived148, n?: number): Base148 { return new Base148()};
  static fooDDO148(p: Derived148, n?: number): Derived148 { return p};
  static fooBBR148(p: Base148, ...n: number[]): Base148 {return p};
  static fooBDR148(p: Base148, ...n: number[]): Derived148 {return new Derived148()};
  static fooDBR148(p: Derived148, ...n: number[]): Base148 { return new Base148()};
  static fooDDR148(p: Derived148, ...n: number[]): Derived148 { return p};
}
let foobb148 = C148.fooBB148
let foobd148 = C148.fooBD148
let foodb148 = C148.fooDB148
let foodd148 = C148.fooDD148
let foobbn148 = C148.fooBBN148
let foobdn148 = C148.fooBDN148
let foodbn148 = C148.fooDBN148
let fooddn148 = C148.fooDDN148
let foobbo148 = C148.fooBBO148
let foobdo148 = C148.fooBDO148
let foodbo148 = C148.fooDBO148
let fooddo148 = C148.fooDDO148
let foobbr148 = C148.fooBBR148
let foobdr148 = C148.fooBDR148
let foodbr148 = C148.fooDBR148
let fooddr148 = C148.fooDDR148
foodbo148 = foobdo148


class Base149 {
  b: string = 'b'
}
class Derived149 extends Base149 {
  b: string = 'd'
}
class C149 {
  static fooBB149(p: Base149): Base149 {return p};
  static fooBD149(p: Base149): Derived149 {return new Derived149()};
  static fooDB149(p: Derived149): Base149 { return new Base149()};
  static fooDD149(p: Derived149): Derived149 { return p};
  static fooBBN149(p: Base149, n: number): Base149 {return p};
  static fooBDN149(p: Base149, n: number): Derived149 {return new Derived149()};
  static fooDBN149(p: Derived149, n: number): Base149 { return new Base149()};
  static fooDDN149(p: Derived149, n: number): Derived149 { return p};
  static fooBBO149(p: Base149, n?: number): Base149 {return p};
  static fooBDO149(p: Base149, n?: number): Derived149 {return new Derived149()};
  static fooDBO149(p: Derived149, n?: number): Base149 { return new Base149()};
  static fooDDO149(p: Derived149, n?: number): Derived149 { return p};
  static fooBBR149(p: Base149, ...n: number[]): Base149 {return p};
  static fooBDR149(p: Base149, ...n: number[]): Derived149 {return new Derived149()};
  static fooDBR149(p: Derived149, ...n: number[]): Base149 { return new Base149()};
  static fooDDR149(p: Derived149, ...n: number[]): Derived149 { return p};
}
let foobb149 = C149.fooBB149
let foobd149 = C149.fooBD149
let foodb149 = C149.fooDB149
let foodd149 = C149.fooDD149
let foobbn149 = C149.fooBBN149
let foobdn149 = C149.fooBDN149
let foodbn149 = C149.fooDBN149
let fooddn149 = C149.fooDDN149
let foobbo149 = C149.fooBBO149
let foobdo149 = C149.fooBDO149
let foodbo149 = C149.fooDBO149
let fooddo149 = C149.fooDDO149
let foobbr149 = C149.fooBBR149
let foobdr149 = C149.fooBDR149
let foodbr149 = C149.fooDBR149
let fooddr149 = C149.fooDDR149
foodbr149 = foobdr149


class Base150 {
  b: string = 'b'
}
class Derived150 extends Base150 {
  b: string = 'd'
}
class C150 {
  static fooBB150(p: Base150): Base150 {return p};
  static fooBD150(p: Base150): Derived150 {return new Derived150()};
  static fooDB150(p: Derived150): Base150 { return new Base150()};
  static fooDD150(p: Derived150): Derived150 { return p};
  static fooBBN150(p: Base150, n: number): Base150 {return p};
  static fooBDN150(p: Base150, n: number): Derived150 {return new Derived150()};
  static fooDBN150(p: Derived150, n: number): Base150 { return new Base150()};
  static fooDDN150(p: Derived150, n: number): Derived150 { return p};
  static fooBBO150(p: Base150, n?: number): Base150 {return p};
  static fooBDO150(p: Base150, n?: number): Derived150 {return new Derived150()};
  static fooDBO150(p: Derived150, n?: number): Base150 { return new Base150()};
  static fooDDO150(p: Derived150, n?: number): Derived150 { return p};
  static fooBBR150(p: Base150, ...n: number[]): Base150 {return p};
  static fooBDR150(p: Base150, ...n: number[]): Derived150 {return new Derived150()};
  static fooDBR150(p: Derived150, ...n: number[]): Base150 { return new Base150()};
  static fooDDR150(p: Derived150, ...n: number[]): Derived150 { return p};
}
let foobb150 = C150.fooBB150
let foobd150 = C150.fooBD150
let foodb150 = C150.fooDB150
let foodd150 = C150.fooDD150
let foobbn150 = C150.fooBBN150
let foobdn150 = C150.fooBDN150
let foodbn150 = C150.fooDBN150
let fooddn150 = C150.fooDDN150
let foobbo150 = C150.fooBBO150
let foobdo150 = C150.fooBDO150
let foodbo150 = C150.fooDBO150
let fooddo150 = C150.fooDDO150
let foobbr150 = C150.fooBBR150
let foobdr150 = C150.fooBDR150
let foodbr150 = C150.fooDBR150
let fooddr150 = C150.fooDDR150
foodbn150 = foobbn150


class Base151 {
  b: string = 'b'
}
class Derived151 extends Base151 {
  b: string = 'd'
}
class C151 {
  static fooBB151(p: Base151): Base151 {return p};
  static fooBD151(p: Base151): Derived151 {return new Derived151()};
  static fooDB151(p: Derived151): Base151 { return new Base151()};
  static fooDD151(p: Derived151): Derived151 { return p};
  static fooBBN151(p: Base151, n: number): Base151 {return p};
  static fooBDN151(p: Base151, n: number): Derived151 {return new Derived151()};
  static fooDBN151(p: Derived151, n: number): Base151 { return new Base151()};
  static fooDDN151(p: Derived151, n: number): Derived151 { return p};
  static fooBBO151(p: Base151, n?: number): Base151 {return p};
  static fooBDO151(p: Base151, n?: number): Derived151 {return new Derived151()};
  static fooDBO151(p: Derived151, n?: number): Base151 { return new Base151()};
  static fooDDO151(p: Derived151, n?: number): Derived151 { return p};
  static fooBBR151(p: Base151, ...n: number[]): Base151 {return p};
  static fooBDR151(p: Base151, ...n: number[]): Derived151 {return new Derived151()};
  static fooDBR151(p: Derived151, ...n: number[]): Base151 { return new Base151()};
  static fooDDR151(p: Derived151, ...n: number[]): Derived151 { return p};
}
let foobb151 = C151.fooBB151
let foobd151 = C151.fooBD151
let foodb151 = C151.fooDB151
let foodd151 = C151.fooDD151
let foobbn151 = C151.fooBBN151
let foobdn151 = C151.fooBDN151
let foodbn151 = C151.fooDBN151
let fooddn151 = C151.fooDDN151
let foobbo151 = C151.fooBBO151
let foobdo151 = C151.fooBDO151
let foodbo151 = C151.fooDBO151
let fooddo151 = C151.fooDDO151
let foobbr151 = C151.fooBBR151
let foobdr151 = C151.fooBDR151
let foodbr151 = C151.fooDBR151
let fooddr151 = C151.fooDDR151
foodbo151 = foobbo151


class Base152 {
  b: string = 'b'
}
class Derived152 extends Base152 {
  b: string = 'd'
}
class C152 {
  static fooBB152(p: Base152): Base152 {return p};
  static fooBD152(p: Base152): Derived152 {return new Derived152()};
  static fooDB152(p: Derived152): Base152 { return new Base152()};
  static fooDD152(p: Derived152): Derived152 { return p};
  static fooBBN152(p: Base152, n: number): Base152 {return p};
  static fooBDN152(p: Base152, n: number): Derived152 {return new Derived152()};
  static fooDBN152(p: Derived152, n: number): Base152 { return new Base152()};
  static fooDDN152(p: Derived152, n: number): Derived152 { return p};
  static fooBBO152(p: Base152, n?: number): Base152 {return p};
  static fooBDO152(p: Base152, n?: number): Derived152 {return new Derived152()};
  static fooDBO152(p: Derived152, n?: number): Base152 { return new Base152()};
  static fooDDO152(p: Derived152, n?: number): Derived152 { return p};
  static fooBBR152(p: Base152, ...n: number[]): Base152 {return p};
  static fooBDR152(p: Base152, ...n: number[]): Derived152 {return new Derived152()};
  static fooDBR152(p: Derived152, ...n: number[]): Base152 { return new Base152()};
  static fooDDR152(p: Derived152, ...n: number[]): Derived152 { return p};
}
let foobb152 = C152.fooBB152
let foobd152 = C152.fooBD152
let foodb152 = C152.fooDB152
let foodd152 = C152.fooDD152
let foobbn152 = C152.fooBBN152
let foobdn152 = C152.fooBDN152
let foodbn152 = C152.fooDBN152
let fooddn152 = C152.fooDDN152
let foobbo152 = C152.fooBBO152
let foobdo152 = C152.fooBDO152
let foodbo152 = C152.fooDBO152
let fooddo152 = C152.fooDDO152
let foobbr152 = C152.fooBBR152
let foobdr152 = C152.fooBDR152
let foodbr152 = C152.fooDBR152
let fooddr152 = C152.fooDDR152
foodbr152 = foobbr152

export default function SubtypingForFunctionTypesTest06(): void {
  describe('SubtypingForFunctionTypesTest06', () => {
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
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_3800
     * @tc.name      testPositiveStaticMethod0137
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
    it("testPositiveStaticMethod0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0137';

      expect(foodb137(new Derived137) instanceof Derived137).assertTrue()
      expect(foodb137(new Derived137).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_3900
     * @tc.name      testPositiveStaticMethod0138
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
    it("testPositiveStaticMethod0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0138';

      let r = foodd138.unsafeCall(new Base138)
      expect(r instanceof Derived138).assertTrue()
      expect((r as Base138).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_4000
     * @tc.name      testPositiveStaticMethod0139
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
    it("testPositiveStaticMethod0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0139';

      expect(foobbn139(new Base139, 1) instanceof Base139).assertTrue()
      expect(foobbn139(new Base139, 1).b).assertEqual('b')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_4100
     * @tc.name      testPositiveStaticMethod0140
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
    it("testPositiveStaticMethod0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0140';

      expect(foobbo140(new Base140) instanceof Base140).assertTrue()
      expect(foobbo140(new Base140).b).assertEqual('b')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_4200
     * @tc.name      testPositiveStaticMethod0141
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
    it("testPositiveStaticMethod0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0141';

      expect(foobbn141(new Base141, 1) instanceof Derived141).assertTrue()
      expect(foobbn141(new Base141, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_4300
     * @tc.name      testPositiveStaticMethod0142
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
    it("testPositiveStaticMethod0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0142';

      expect(foobbo142(new Base142) instanceof Derived142).assertTrue()
      expect(foobbo142(new Base142).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_4400
     * @tc.name      testPositiveStaticMethod0143
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
    it("testPositiveStaticMethod0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0143';

      expect(foodbn143(new Derived143, 1) instanceof Derived143).assertTrue()
      expect(foodbn143(new Derived143, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_4500
     * @tc.name      testPositiveStaticMethod0144
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
    it("testPositiveStaticMethod0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0144';

      expect(foodbo144(new Derived144) instanceof Derived144).assertTrue()
      expect(foodbo144(new Derived144).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_4600
     * @tc.name      testPositiveStaticMethod0145
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
    it("testPositiveStaticMethod0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0145';

      expect(foodbn145(new Derived145, 1) instanceof Derived145).assertTrue()
      expect(foodbn145(new Derived145, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_4700
     * @tc.name      testPositiveStaticMethod0146
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
    it("testPositiveStaticMethod0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0146';

      expect(foodbo146(new Derived146) instanceof Derived146).assertTrue()
      expect(foodbo146(new Derived146).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_4800
     * @tc.name      testPositiveStaticMethod0147
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
    it("testPositiveStaticMethod0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0147';

      expect(foodbn147(new Derived147, 1) instanceof Derived147).assertTrue()
      expect(foodbn147(new Derived147, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_4900
     * @tc.name      testPositiveStaticMethod0148
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
    it("testPositiveStaticMethod0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0148';

      expect(foodbo148(new Derived148) instanceof Derived148).assertTrue()
      expect(foodbo148(new Derived148).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_5000
     * @tc.name      testPositiveStaticMethod0149
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
    it("testPositiveStaticMethod0149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0149';

      expect(foodbr149(new Derived149, 1, 2, 3) instanceof Derived149).assertTrue()
      expect(foodbr149(new Derived149, 1, 2, 3).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_5100
     * @tc.name      testPositiveStaticMethod0150
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
    it("testPositiveStaticMethod0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0150';

      let r = foodbn150.unsafeCall(new Base150, 1.0)

      expect(r instanceof Base150).assertTrue()
      expect((r as Base150).b).assertEqual('b')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_5200
     * @tc.name      testPositiveStaticMethod0151
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
    it("testPositiveStaticMethod0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0151';


      let r = foodbo151.unsafeCall(new Base151)

      expect(r instanceof Base151).assertTrue()
      expect((r as Base151).b).assertEqual('b')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1_5300
     * @tc.name      testPositiveStaticMethod0152
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
    it("testPositiveStaticMethod0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveStaticMethod0152';

      let r = foodbr152.unsafeCall(new Base152, 1.0, 2.0, 3.0)
      expect(r instanceof Base152).assertTrue()
      expect((r as Base152).b).assertEqual('b')
    });
  })
}