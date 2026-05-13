import {
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType
} from '../../../../../hypium/index';

class Base45 {
  b: string = 'b'
}
class Derived45 extends Base45 {
  b: string = 'd'
}
class C45 {
  fooBB45(p: Base45): Base45 {return p};
  fooBD45(p: Base45): Derived45 {return new Derived45()};
  fooDB45(p: Derived45): Base45 { return new Base45()};
  fooDD45(p: Derived45): Derived45 { return p};
  fooBBN45(p: Base45, n: number): Base45 {return p};
  fooBDN45(p: Base45, n: number): Derived45 {return new Derived45()};
  fooDBN45(p: Derived45, n: number): Base45 { return new Base45()};
  fooDDN45(p: Derived45, n: number): Derived45 { return p};
  fooBBO45(p: Base45, n?: number): Base45 {return p};
  fooBDO45(p: Base45, n?: number): Derived45 {return new Derived45()};
  fooDBO45(p: Derived45, n?: number): Base45 { return new Base45()};
  fooDDO45(p: Derived45, n?: number): Derived45 { return p};
  fooBBR45(p: Base45, ...n: number[]): Base45 {return p};
  fooBDR45(p: Base45, ...n: number[]): Derived45 {return new Derived45()};
  fooDBR45(p: Derived45, ...n: number[]): Base45 { return new Base45()};
  fooDDR45(p: Derived45, ...n: number[]): Derived45 { return p};
}
const c45: C45 = new C45()
let foobb45 = c45.fooBB45
let foobd45 = c45.fooBD45
let foodb45 = c45.fooDB45
let foodd45 = c45.fooDD45
let foobbn45 = c45.fooBBN45
let foobdn45 = c45.fooBDN45
let foodbn45 = c45.fooDBN45
let fooddn45 = c45.fooDDN45
let foobbo45 = c45.fooBBO45
let foobdo45 = c45.fooBDO45
let foodbo45 = c45.fooDBO45
let fooddo45 = c45.fooDDO45
let foobbr45 = c45.fooBBR45
let foobdr45 = c45.fooBDR45
let foodbr45 = c45.fooDBR45
let fooddr45 = c45.fooDDR45
foobbn45 = foobd45


class Base46 {
  b: string = 'b'
}
class Derived46 extends Base46 {
  b: string = 'd'
}
class C46 {
  fooBB46(p: Base46): Base46 {return p};
  fooBD46(p: Base46): Derived46 {return new Derived46()};
  fooDB46(p: Derived46): Base46 { return new Base46()};
  fooDD46(p: Derived46): Derived46 { return p};
  fooBBN46(p: Base46, n: number): Base46 {return p};
  fooBDN46(p: Base46, n: number): Derived46 {return new Derived46()};
  fooDBN46(p: Derived46, n: number): Base46 { return new Base46()};
  fooDDN46(p: Derived46, n: number): Derived46 { return p};
  fooBBO46(p: Base46, n?: number): Base46 {return p};
  fooBDO46(p: Base46, n?: number): Derived46 {return new Derived46()};
  fooDBO46(p: Derived46, n?: number): Base46 { return new Base46()};
  fooDDO46(p: Derived46, n?: number): Derived46 { return p};
  fooBBR46(p: Base46, ...n: number[]): Base46 {return p};
  fooBDR46(p: Base46, ...n: number[]): Derived46 {return new Derived46()};
  fooDBR46(p: Derived46, ...n: number[]): Base46 { return new Base46()};
  fooDDR46(p: Derived46, ...n: number[]): Derived46 { return p};
}
const c46: C46 = new C46()
let foobb46 = c46.fooBB46
let foobd46 = c46.fooBD46
let foodb46 = c46.fooDB46
let foodd46 = c46.fooDD46
let foobbn46 = c46.fooBBN46
let foobdn46 = c46.fooBDN46
let foodbn46 = c46.fooDBN46
let fooddn46 = c46.fooDDN46
let foobbo46 = c46.fooBBO46
let foobdo46 = c46.fooBDO46
let foodbo46 = c46.fooDBO46
let fooddo46 = c46.fooDDO46
let foobbr46 = c46.fooBBR46
let foobdr46 = c46.fooBDR46
let foodbr46 = c46.fooDBR46
let fooddr46 = c46.fooDDR46
foobbo46 = foobd46


class Base47 {
  b: string = 'b'
}
class Derived47 extends Base47 {
  b: string = 'd'
}
class C47 {
  fooBB47(p: Base47): Base47 {return p};
  fooBD47(p: Base47): Derived47 {return new Derived47()};
  fooDB47(p: Derived47): Base47 { return new Base47()};
  fooDD47(p: Derived47): Derived47 { return p};
  fooBBN47(p: Base47, n: number): Base47 {return p};
  fooBDN47(p: Base47, n: number): Derived47 {return new Derived47()};
  fooDBN47(p: Derived47, n: number): Base47 { return new Base47()};
  fooDDN47(p: Derived47, n: number): Derived47 { return p};
  fooBBO47(p: Base47, n?: number): Base47 {return p};
  fooBDO47(p: Base47, n?: number): Derived47 {return new Derived47()};
  fooDBO47(p: Derived47, n?: number): Base47 { return new Base47()};
  fooDDO47(p: Derived47, n?: number): Derived47 { return p};
  fooBBR47(p: Base47, ...n: number[]): Base47 {return p};
  fooBDR47(p: Base47, ...n: number[]): Derived47 {return new Derived47()};
  fooDBR47(p: Derived47, ...n: number[]): Base47 { return new Base47()};
  fooDDR47(p: Derived47, ...n: number[]): Derived47 { return p};
}
const c47: C47 = new C47()
let foobb47 = c47.fooBB47
let foobd47 = c47.fooBD47
let foodb47 = c47.fooDB47
let foodd47 = c47.fooDD47
let foobbn47 = c47.fooBBN47
let foobdn47 = c47.fooBDN47
let foodbn47 = c47.fooDBN47
let fooddn47 = c47.fooDDN47
let foobbo47 = c47.fooBBO47
let foobdo47 = c47.fooBDO47
let foodbo47 = c47.fooDBO47
let fooddo47 = c47.fooDDO47
let foobbr47 = c47.fooBBR47
let foobdr47 = c47.fooBDR47
let foodbr47 = c47.fooDBR47
let fooddr47 = c47.fooDDR47
foodbn47 = foobd47


class Base48 {
  b: string = 'b'
}
class Derived48 extends Base48 {
  b: string = 'd'
}
class C48 {
  fooBB48(p: Base48): Base48 {return p};
  fooBD48(p: Base48): Derived48 {return new Derived48()};
  fooDB48(p: Derived48): Base48 { return new Base48()};
  fooDD48(p: Derived48): Derived48 { return p};
  fooBBN48(p: Base48, n: number): Base48 {return p};
  fooBDN48(p: Base48, n: number): Derived48 {return new Derived48()};
  fooDBN48(p: Derived48, n: number): Base48 { return new Base48()};
  fooDDN48(p: Derived48, n: number): Derived48 { return p};
  fooBBO48(p: Base48, n?: number): Base48 {return p};
  fooBDO48(p: Base48, n?: number): Derived48 {return new Derived48()};
  fooDBO48(p: Derived48, n?: number): Base48 { return new Base48()};
  fooDDO48(p: Derived48, n?: number): Derived48 { return p};
  fooBBR48(p: Base48, ...n: number[]): Base48 {return p};
  fooBDR48(p: Base48, ...n: number[]): Derived48 {return new Derived48()};
  fooDBR48(p: Derived48, ...n: number[]): Base48 { return new Base48()};
  fooDDR48(p: Derived48, ...n: number[]): Derived48 { return p};
}
const c48: C48 = new C48()
let foobb48 = c48.fooBB48
let foobd48 = c48.fooBD48
let foodb48 = c48.fooDB48
let foodd48 = c48.fooDD48
let foobbn48 = c48.fooBBN48
let foobdn48 = c48.fooBDN48
let foodbn48 = c48.fooDBN48
let fooddn48 = c48.fooDDN48
let foobbo48 = c48.fooBBO48
let foobdo48 = c48.fooBDO48
let foodbo48 = c48.fooDBO48
let fooddo48 = c48.fooDDO48
let foobbr48 = c48.fooBBR48
let foobdr48 = c48.fooBDR48
let foodbr48 = c48.fooDBR48
let fooddr48 = c48.fooDDR48
foodbo48 = foobd48


class Base49 {
  b: string = 'b'
}
class Derived49 extends Base49 {
  b: string = 'd'
}
class C49 {
  fooBB49(p: Base49): Base49 {return p};
  fooBD49(p: Base49): Derived49 {return new Derived49()};
  fooDB49(p: Derived49): Base49 { return new Base49()};
  fooDD49(p: Derived49): Derived49 { return p};
  fooBBN49(p: Base49, n: number): Base49 {return p};
  fooBDN49(p: Base49, n: number): Derived49 {return new Derived49()};
  fooDBN49(p: Derived49, n: number): Base49 { return new Base49()};
  fooDDN49(p: Derived49, n: number): Derived49 { return p};
  fooBBO49(p: Base49, n?: number): Base49 {return p};
  fooBDO49(p: Base49, n?: number): Derived49 {return new Derived49()};
  fooDBO49(p: Derived49, n?: number): Base49 { return new Base49()};
  fooDDO49(p: Derived49, n?: number): Derived49 { return p};
  fooBBR49(p: Base49, ...n: number[]): Base49 {return p};
  fooBDR49(p: Base49, ...n: number[]): Derived49 {return new Derived49()};
  fooDBR49(p: Derived49, ...n: number[]): Base49 { return new Base49()};
  fooDDR49(p: Derived49, ...n: number[]): Derived49 { return p};
}
const c49: C49 = new C49()
let foobb49 = c49.fooBB49
let foobd49 = c49.fooBD49
let foodb49 = c49.fooDB49
let foodd49 = c49.fooDD49
let foobbn49 = c49.fooBBN49
let foobdn49 = c49.fooBDN49
let foodbn49 = c49.fooDBN49
let fooddn49 = c49.fooDDN49
let foobbo49 = c49.fooBBO49
let foobdo49 = c49.fooBDO49
let foodbo49 = c49.fooDBO49
let fooddo49 = c49.fooDDO49
let foobbr49 = c49.fooBBR49
let foobdr49 = c49.fooBDR49
let foodbr49 = c49.fooDBR49
let fooddr49 = c49.fooDDR49
foodbn49 = fooddn49


class Base50 {
  b: string = 'b'
}
class Derived50 extends Base50 {
  b: string = 'd'
}
class C50 {
  fooBB50(p: Base50): Base50 {return p};
  fooBD50(p: Base50): Derived50 {return new Derived50()};
  fooDB50(p: Derived50): Base50 { return new Base50()};
  fooDD50(p: Derived50): Derived50 { return p};
  fooBBN50(p: Base50, n: number): Base50 {return p};
  fooBDN50(p: Base50, n: number): Derived50 {return new Derived50()};
  fooDBN50(p: Derived50, n: number): Base50 { return new Base50()};
  fooDDN50(p: Derived50, n: number): Derived50 { return p};
  fooBBO50(p: Base50, n?: number): Base50 {return p};
  fooBDO50(p: Base50, n?: number): Derived50 {return new Derived50()};
  fooDBO50(p: Derived50, n?: number): Base50 { return new Base50()};
  fooDDO50(p: Derived50, n?: number): Derived50 { return p};
  fooBBR50(p: Base50, ...n: number[]): Base50 {return p};
  fooBDR50(p: Base50, ...n: number[]): Derived50 {return new Derived50()};
  fooDBR50(p: Derived50, ...n: number[]): Base50 { return new Base50()};
  fooDDR50(p: Derived50, ...n: number[]): Derived50 { return p};
}
const c50: C50 = new C50()
let foobb50 = c50.fooBB50
let foobd50 = c50.fooBD50
let foodb50 = c50.fooDB50
let foodd50 = c50.fooDD50
let foobbn50 = c50.fooBBN50
let foobdn50 = c50.fooBDN50
let foodbn50 = c50.fooDBN50
let fooddn50 = c50.fooDDN50
let foobbo50 = c50.fooBBO50
let foobdo50 = c50.fooBDO50
let foodbo50 = c50.fooDBO50
let fooddo50 = c50.fooDDO50
let foobbr50 = c50.fooBBR50
let foobdr50 = c50.fooBDR50
let foodbr50 = c50.fooDBR50
let fooddr50 = c50.fooDDR50
foodbo50 = fooddo50


class Base51 {
  b: string = 'b'
}
class Derived51 extends Base51 {
  b: string = 'd'
}
class C51 {
  fooBB51(p: Base51): Base51 {return p};
  fooBD51(p: Base51): Derived51 {return new Derived51()};
  fooDB51(p: Derived51): Base51 { return new Base51()};
  fooDD51(p: Derived51): Derived51 { return p};
  fooBBN51(p: Base51, n: number): Base51 {return p};
  fooBDN51(p: Base51, n: number): Derived51 {return new Derived51()};
  fooDBN51(p: Derived51, n: number): Base51 { return new Base51()};
  fooDDN51(p: Derived51, n: number): Derived51 { return p};
  fooBBO51(p: Base51, n?: number): Base51 {return p};
  fooBDO51(p: Base51, n?: number): Derived51 {return new Derived51()};
  fooDBO51(p: Derived51, n?: number): Base51 { return new Base51()};
  fooDDO51(p: Derived51, n?: number): Derived51 { return p};
  fooBBR51(p: Base51, ...n: number[]): Base51 {return p};
  fooBDR51(p: Base51, ...n: number[]): Derived51 {return new Derived51()};
  fooDBR51(p: Derived51, ...n: number[]): Base51 { return new Base51()};
  fooDDR51(p: Derived51, ...n: number[]): Derived51 { return p};
}
const c51: C51 = new C51()
let foobb51 = c51.fooBB51
let foobd51 = c51.fooBD51
let foodb51 = c51.fooDB51
let foodd51 = c51.fooDD51
let foobbn51 = c51.fooBBN51
let foobdn51 = c51.fooBDN51
let foodbn51 = c51.fooDBN51
let fooddn51 = c51.fooDDN51
let foobbo51 = c51.fooBBO51
let foobdo51 = c51.fooBDO51
let foodbo51 = c51.fooDBO51
let fooddo51 = c51.fooDDO51
let foobbr51 = c51.fooBBR51
let foobdr51 = c51.fooBDR51
let foodbr51 = c51.fooDBR51
let fooddr51 = c51.fooDDR51
foodbr51 = fooddr51


class Base52 {
  b: string = 'b'
}
class Derived52 extends Base52 {
  b: string = 'd'
}
class C52 {
  fooBB52(p: Base52): Base52 {return p};
  fooBD52(p: Base52): Derived52 {return new Derived52()};
  fooDB52(p: Derived52): Base52 { return new Base52()};
  fooDD52(p: Derived52): Derived52 { return p};
  fooBBN52(p: Base52, n: number): Base52 {return p};
  fooBDN52(p: Base52, n: number): Derived52 {return new Derived52()};
  fooDBN52(p: Derived52, n: number): Base52 { return new Base52()};
  fooDDN52(p: Derived52, n: number): Derived52 { return p};
  fooBBO52(p: Base52, n?: number): Base52 {return p};
  fooBDO52(p: Base52, n?: number): Derived52 {return new Derived52()};
  fooDBO52(p: Derived52, n?: number): Base52 { return new Base52()};
  fooDDO52(p: Derived52, n?: number): Derived52 { return p};
  fooBBR52(p: Base52, ...n: number[]): Base52 {return p};
  fooBDR52(p: Base52, ...n: number[]): Derived52 {return new Derived52()};
  fooDBR52(p: Derived52, ...n: number[]): Base52 { return new Base52()};
  fooDDR52(p: Derived52, ...n: number[]): Derived52 { return p};
}
const c52: C52 = new C52()
let foobb52 = c52.fooBB52
let foobd52 = c52.fooBD52
let foodb52 = c52.fooDB52
let foodd52 = c52.fooDD52
let foobbn52 = c52.fooBBN52
let foobdn52 = c52.fooBDN52
let foodbn52 = c52.fooDBN52
let fooddn52 = c52.fooDDN52
let foobbo52 = c52.fooBBO52
let foobdo52 = c52.fooBDO52
let foodbo52 = c52.fooDBO52
let fooddo52 = c52.fooDDO52
let foobbr52 = c52.fooBBR52
let foobdr52 = c52.fooBDR52
let foodbr52 = c52.fooDBR52
let fooddr52 = c52.fooDDR52
foodbn52 = foobdn52


class Base53 {
  b: string = 'b'
}
class Derived53 extends Base53 {
  b: string = 'd'
}
class C53 {
  fooBB53(p: Base53): Base53 {return p};
  fooBD53(p: Base53): Derived53 {return new Derived53()};
  fooDB53(p: Derived53): Base53 { return new Base53()};
  fooDD53(p: Derived53): Derived53 { return p};
  fooBBN53(p: Base53, n: number): Base53 {return p};
  fooBDN53(p: Base53, n: number): Derived53 {return new Derived53()};
  fooDBN53(p: Derived53, n: number): Base53 { return new Base53()};
  fooDDN53(p: Derived53, n: number): Derived53 { return p};
  fooBBO53(p: Base53, n?: number): Base53 {return p};
  fooBDO53(p: Base53, n?: number): Derived53 {return new Derived53()};
  fooDBO53(p: Derived53, n?: number): Base53 { return new Base53()};
  fooDDO53(p: Derived53, n?: number): Derived53 { return p};
  fooBBR53(p: Base53, ...n: number[]): Base53 {return p};
  fooBDR53(p: Base53, ...n: number[]): Derived53 {return new Derived53()};
  fooDBR53(p: Derived53, ...n: number[]): Base53 { return new Base53()};
  fooDDR53(p: Derived53, ...n: number[]): Derived53 { return p};
}
const c53: C53 = new C53()
let foobb53 = c53.fooBB53
let foobd53 = c53.fooBD53
let foodb53 = c53.fooDB53
let foodd53 = c53.fooDD53
let foobbn53 = c53.fooBBN53
let foobdn53 = c53.fooBDN53
let foodbn53 = c53.fooDBN53
let fooddn53 = c53.fooDDN53
let foobbo53 = c53.fooBBO53
let foobdo53 = c53.fooBDO53
let foodbo53 = c53.fooDBO53
let fooddo53 = c53.fooDDO53
let foobbr53 = c53.fooBBR53
let foobdr53 = c53.fooBDR53
let foodbr53 = c53.fooDBR53
let fooddr53 = c53.fooDDR53
foodbo53 = foobdo53


class Base54 {
  b: string = 'b'
}
class Derived54 extends Base54 {
  b: string = 'd'
}
class C54 {
  fooBB54(p: Base54): Base54 {return p};
  fooBD54(p: Base54): Derived54 {return new Derived54()};
  fooDB54(p: Derived54): Base54 { return new Base54()};
  fooDD54(p: Derived54): Derived54 { return p};
  fooBBN54(p: Base54, n: number): Base54 {return p};
  fooBDN54(p: Base54, n: number): Derived54 {return new Derived54()};
  fooDBN54(p: Derived54, n: number): Base54 { return new Base54()};
  fooDDN54(p: Derived54, n: number): Derived54 { return p};
  fooBBO54(p: Base54, n?: number): Base54 {return p};
  fooBDO54(p: Base54, n?: number): Derived54 {return new Derived54()};
  fooDBO54(p: Derived54, n?: number): Base54 { return new Base54()};
  fooDDO54(p: Derived54, n?: number): Derived54 { return p};
  fooBBR54(p: Base54, ...n: number[]): Base54 {return p};
  fooBDR54(p: Base54, ...n: number[]): Derived54 {return new Derived54()};
  fooDBR54(p: Derived54, ...n: number[]): Base54 { return new Base54()};
  fooDDR54(p: Derived54, ...n: number[]): Derived54 { return p};
}
const c54: C54 = new C54()
let foobb54 = c54.fooBB54
let foobd54 = c54.fooBD54
let foodb54 = c54.fooDB54
let foodd54 = c54.fooDD54
let foobbn54 = c54.fooBBN54
let foobdn54 = c54.fooBDN54
let foodbn54 = c54.fooDBN54
let fooddn54 = c54.fooDDN54
let foobbo54 = c54.fooBBO54
let foobdo54 = c54.fooBDO54
let foodbo54 = c54.fooDBO54
let fooddo54 = c54.fooDDO54
let foobbr54 = c54.fooBBR54
let foobdr54 = c54.fooBDR54
let foodbr54 = c54.fooDBR54
let fooddr54 = c54.fooDDR54
foodbo54 = foobdo54


class Base55 {
  b: string = 'b'
}
class Derived55 extends Base55 {
  b: string = 'd'
}
class C55 {
  fooBB55(p: Base55): Base55 {return p};
  fooBD55(p: Base55): Derived55 {return new Derived55()};
  fooDB55(p: Derived55): Base55 { return new Base55()};
  fooDD55(p: Derived55): Derived55 { return p};
  fooBBN55(p: Base55, n: number): Base55 {return p};
  fooBDN55(p: Base55, n: number): Derived55 {return new Derived55()};
  fooDBN55(p: Derived55, n: number): Base55 { return new Base55()};
  fooDDN55(p: Derived55, n: number): Derived55 { return p};
  fooBBO55(p: Base55, n?: number): Base55 {return p};
  fooBDO55(p: Base55, n?: number): Derived55 {return new Derived55()};
  fooDBO55(p: Derived55, n?: number): Base55 { return new Base55()};
  fooDDO55(p: Derived55, n?: number): Derived55 { return p};
  fooBBR55(p: Base55, ...n: number[]): Base55 {return p};
  fooBDR55(p: Base55, ...n: number[]): Derived55 {return new Derived55()};
  fooDBR55(p: Derived55, ...n: number[]): Base55 { return new Base55()};
  fooDDR55(p: Derived55, ...n: number[]): Derived55 { return p};
}
const c55: C55 = new C55()
let foobb55 = c55.fooBB55
let foobd55 = c55.fooBD55
let foodb55 = c55.fooDB55
let foodd55 = c55.fooDD55
let foobbn55 = c55.fooBBN55
let foobdn55 = c55.fooBDN55
let foodbn55 = c55.fooDBN55
let fooddn55 = c55.fooDDN55
let foobbo55 = c55.fooBBO55
let foobdo55 = c55.fooBDO55
let foodbo55 = c55.fooDBO55
let fooddo55 = c55.fooDDO55
let foobbr55 = c55.fooBBR55
let foobdr55 = c55.fooBDR55
let foodbr55 = c55.fooDBR55
let fooddr55 = c55.fooDDR55
foodbr55 = foobdr55


class Base56 {
  b: string = 'b'
}
class Derived56 extends Base56 {
  b: string = 'd'
}
class C56 {
  fooBB56(p: Base56): Base56 {return p};
  fooBD56(p: Base56): Derived56 {return new Derived56()};
  fooDB56(p: Derived56): Base56 { return new Base56()};
  fooDD56(p: Derived56): Derived56 { return p};
  fooBBN56(p: Base56, n: number): Base56 {return p};
  fooBDN56(p: Base56, n: number): Derived56 {return new Derived56()};
  fooDBN56(p: Derived56, n: number): Base56 { return new Base56()};
  fooDDN56(p: Derived56, n: number): Derived56 { return p};
  fooBBO56(p: Base56, n?: number): Base56 {return p};
  fooBDO56(p: Base56, n?: number): Derived56 {return new Derived56()};
  fooDBO56(p: Derived56, n?: number): Base56 { return new Base56()};
  fooDDO56(p: Derived56, n?: number): Derived56 { return p};
  fooBBR56(p: Base56, ...n: number[]): Base56 {return p};
  fooBDR56(p: Base56, ...n: number[]): Derived56 {return new Derived56()};
  fooDBR56(p: Derived56, ...n: number[]): Base56 { return new Base56()};
  fooDDR56(p: Derived56, ...n: number[]): Derived56 { return p};
}
const c56: C56 = new C56()
let foobb56 = c56.fooBB56
let foobd56 = c56.fooBD56
let foodb56 = c56.fooDB56
let foodd56 = c56.fooDD56
let foobbn56 = c56.fooBBN56
let foobdn56 = c56.fooBDN56
let foodbn56 = c56.fooDBN56
let fooddn56 = c56.fooDDN56
let foobbo56 = c56.fooBBO56
let foobdo56 = c56.fooBDO56
let foodbo56 = c56.fooDBO56
let fooddo56 = c56.fooDDO56
let foobbr56 = c56.fooBBR56
let foobdr56 = c56.fooBDR56
let foodbr56 = c56.fooDBR56
let fooddr56 = c56.fooDDR56
foodbn56 = foobbn56


class Base57 {
  b: string = 'b'
}
class Derived57 extends Base57 {
  b: string = 'd'
}
class C57 {
  fooBB57(p: Base57): Base57 {return p};
  fooBD57(p: Base57): Derived57 {return new Derived57()};
  fooDB57(p: Derived57): Base57 { return new Base57()};
  fooDD57(p: Derived57): Derived57 { return p};
  fooBBN57(p: Base57, n: number): Base57 {return p};
  fooBDN57(p: Base57, n: number): Derived57 {return new Derived57()};
  fooDBN57(p: Derived57, n: number): Base57 { return new Base57()};
  fooDDN57(p: Derived57, n: number): Derived57 { return p};
  fooBBO57(p: Base57, n?: number): Base57 {return p};
  fooBDO57(p: Base57, n?: number): Derived57 {return new Derived57()};
  fooDBO57(p: Derived57, n?: number): Base57 { return new Base57()};
  fooDDO57(p: Derived57, n?: number): Derived57 { return p};
  fooBBR57(p: Base57, ...n: number[]): Base57 {return p};
  fooBDR57(p: Base57, ...n: number[]): Derived57 {return new Derived57()};
  fooDBR57(p: Derived57, ...n: number[]): Base57 { return new Base57()};
  fooDDR57(p: Derived57, ...n: number[]): Derived57 { return p};
}
const c57: C57 = new C57()
let foobb57 = c57.fooBB57
let foobd57 = c57.fooBD57
let foodb57 = c57.fooDB57
let foodd57 = c57.fooDD57
let foobbn57 = c57.fooBBN57
let foobdn57 = c57.fooBDN57
let foodbn57 = c57.fooDBN57
let fooddn57 = c57.fooDDN57
let foobbo57 = c57.fooBBO57
let foobdo57 = c57.fooBDO57
let foodbo57 = c57.fooDBO57
let fooddo57 = c57.fooDDO57
let foobbr57 = c57.fooBBR57
let foobdr57 = c57.fooBDR57
let foodbr57 = c57.fooDBR57
let fooddr57 = c57.fooDDR57
foodbo57 = foobbo57


class Base58 {
  b: string = 'b'
}
class Derived58 extends Base58 {
  b: string = 'd'
}
class C58 {
  fooBB58(p: Base58): Base58 {return p};
  fooBD58(p: Base58): Derived58 {return new Derived58()};
  fooDB58(p: Derived58): Base58 { return new Base58()};
  fooDD58(p: Derived58): Derived58 { return p};
  fooBBN58(p: Base58, n: number): Base58 {return p};
  fooBDN58(p: Base58, n: number): Derived58 {return new Derived58()};
  fooDBN58(p: Derived58, n: number): Base58 { return new Base58()};
  fooDDN58(p: Derived58, n: number): Derived58 { return p};
  fooBBO58(p: Base58, n?: number): Base58 {return p};
  fooBDO58(p: Base58, n?: number): Derived58 {return new Derived58()};
  fooDBO58(p: Derived58, n?: number): Base58 { return new Base58()};
  fooDDO58(p: Derived58, n?: number): Derived58 { return p};
  fooBBR58(p: Base58, ...n: number[]): Base58 {return p};
  fooBDR58(p: Base58, ...n: number[]): Derived58 {return new Derived58()};
  fooDBR58(p: Derived58, ...n: number[]): Base58 { return new Base58()};
  fooDDR58(p: Derived58, ...n: number[]): Derived58 { return p};
}
const c58: C58 = new C58()
let foobb58 = c58.fooBB58
let foobd58 = c58.fooBD58
let foodb58 = c58.fooDB58
let foodd58 = c58.fooDD58
let foobbn58 = c58.fooBBN58
let foobdn58 = c58.fooBDN58
let foodbn58 = c58.fooDBN58
let fooddn58 = c58.fooDDN58
let foobbo58 = c58.fooBBO58
let foobdo58 = c58.fooBDO58
let foodbo58 = c58.fooDBO58
let fooddo58 = c58.fooDDO58
let foobbr58 = c58.fooBBR58
let foobdr58 = c58.fooBDR58
let foodbr58 = c58.fooDBR58
let fooddr58 = c58.fooDDR58
foodbr58 = foobbr58

class Base59 {}
class Derived59 extends Base59 {}
class C59 {
  fooBB59<T59>(p: T59): T59 {return p};
  fooBD59<T59, G59 extends T59>(p: T59): G59 {return p as G59};
  fooDB59<G59 extends T59, T59>(p: G59): T59 { return p as T59};
  fooDD59<G59 extends T59, T59>(p: G59): G59 { return p};
  fooBBN59<T59>(p: T59, n: number): T59 {return p};
  fooBDN59<T59, G59 extends T59>(p: T59, n: number): G59 {return p as G59};
  fooDBN59<G59 extends T59, T59>(p: G59, n: number): T59 { return p as T59};
  fooDDN59<G59 extends T59, T59>(p: G59, n: number): G59 { return p};
  fooBBO59<T59>(p: T59, n?: number): T59 {return p};
  fooBDO59<T59, G59 extends T59>(p: T59, n?: number): G59 {return p as G59};
  fooDBO59<G59 extends T59, T59>(p: G59, n?: number): T59 { return p as T59};
  fooDDO59<G59 extends T59, T59>(p: G59, n?: number): G59 { return p};
  fooBBR59<T59>(p: T59, ...n: number[]): T59 {return p};
  fooBDR59<T59, G59 extends T59>(p: T59, ...n: number[]): G59 {return p as G59};
  fooDBR59<G59 extends T59, T59>(p: G59, ...n: number[]): T59 { return p as T59};
  fooDDR59<G59 extends T59, T59>(p: G59, ...n: number[]): G59 { return p};
}
const c59: C59 = new C59()

let foobb59: (p: Base59) => Base59 = c59.fooBB59<Base59>;
let foobd59: (p: Base59) => Derived59 = c59.fooBD59<Base59, Derived59>;
let foodb59: (p: Derived59) => Base59 = c59.fooDB59<Derived59, Base59>;
let foodd59: (p: Derived59) => Derived59 = c59.fooDD59<Derived59, Base59>;

let foobbn59: (p: Base59, n: number) => Base59 = c59.fooBBN59<Base59>;
let foobdn59: (p: Base59, n: number) => Derived59 = c59.fooBDN59<Base59, Derived59>;
let foodbn59: (p: Derived59, n: number) => Base59 = c59.fooDBN59<Derived59, Base59>;
let fooddn59: (p: Derived59, n: number) => Derived59 = c59.fooDDN59<Derived59, Base59>;

let foobbo59: (p: Base59, n?: number) => Base59 = c59.fooBBO59<Base59>;
let foobdo59: (p: Base59, n?: number) => Derived59 = c59.fooBDO59<Base59, Derived59>;
let foodbo59: (p: Derived59, n?: number) => Base59 = c59.fooDBO59<Derived59, Base59>;
let fooddo59: (p: Derived59, n?: number) => Derived59 = c59.fooDDO59<Derived59, Base59>;

let foobbr59: (p: Base59, ...n: number[]) => Base59 = c59.fooBBR59<Base59>;
let foobdr59: (p: Base59, ...n: number[]) => Derived59 = c59.fooBDR59<Base59, Derived59>;
let foodbr59: (p: Derived59, ...n: number[]) => Base59 = c59.fooDBR59<Derived59, Base59>;
let fooddr59: (p: Derived59, ...n: number[]) => Derived59 = c59.fooDDR59<Derived59, Base59>;

foobb59 = foobd59;

class Base60 {}
class Derived60 extends Base60 {}
class C60 {
  fooBB60<T60>(p: T60): T60 {return p};
  fooBD60<T60, G60 extends T60>(p: T60): G60 {return p as G60};
  fooDB60<G60 extends T60, T60>(p: G60): T60 { return p as T60};
  fooDD60<G60 extends T60, T60>(p: G60): G60 { return p};
  fooBBN60<T60>(p: T60, n: number): T60 {return p};
  fooBDN60<T60, G60 extends T60>(p: T60, n: number): G60 {return p as G60};
  fooDBN60<G60 extends T60, T60>(p: G60, n: number): T60 { return p as T60};
  fooDDN60<G60 extends T60, T60>(p: G60, n: number): G60 { return p};
  fooBBO60<T60>(p: T60, n?: number): T60 {return p};
  fooBDO60<T60, G60 extends T60>(p: T60, n?: number): G60 {return p as G60};
  fooDBO60<G60 extends T60, T60>(p: G60, n?: number): T60 { return p as T60};
  fooDDO60<G60 extends T60, T60>(p: G60, n?: number): G60 { return p};
  fooBBR60<T60>(p: T60, ...n: number[]): T60 {return p};
  fooBDR60<T60, G60 extends T60>(p: T60, ...n: number[]): G60 {return p as G60};
  fooDBR60<G60 extends T60, T60>(p: G60, ...n: number[]): T60 { return p as T60};
  fooDDR60<G60 extends T60, T60>(p: G60, ...n: number[]): G60 { return p};
}
const c60: C60 = new C60()
let foobb60: (p: Base60) => Base60 = c60.fooBB60<Base60>;
let foobd60: (p: Base60) => Derived60 = c60.fooBD60<Base60, Derived60>;
let foodb60: (p: Derived60) => Base60 = c60.fooDB60<Derived60, Base60>;
let foodd60: (p: Derived60) => Derived60 = c60.fooDD60<Derived60, Base60>;
let foobbn60: (p: Base60, n: number) => Base60 = c60.fooBBN60<Base60>;
let foobdn60: (p: Base60, n: number) => Derived60 = c60.fooBDN60<Base60, Derived60>;
let foodbn60: (p: Derived60, n: number) => Base60 = c60.fooDBN60<Derived60, Base60>;
let fooddn60: (p: Derived60, n: number) => Derived60 = c60.fooDDN60<Derived60, Base60>;
let foobbo60: (p: Base60, n?: number) => Base60 = c60.fooBBO60<Base60>;
let foobdo60: (p: Base60, n?: number) => Derived60 = c60.fooBDO60<Base60, Derived60>;
let foodbo60: (p: Derived60, n?: number) => Base60 = c60.fooDBO60<Derived60, Base60>;
let fooddo60: (p: Derived60, n?: number) => Derived60 = c60.fooDDO60<Derived60, Base60>;
let foobbr60: (p: Base60, ...n: number[]) => Base60 = c60.fooBBR60<Base60>;
let foobdr60: (p: Base60, ...n: number[]) => Derived60 = c60.fooBDR60<Base60, Derived60>;
let foodbr60: (p: Derived60, ...n: number[]) => Base60 = c60.fooDBR60<Derived60, Base60>;
let fooddr60: (p: Derived60, ...n: number[]) => Derived60 = c60.fooDDR60<Derived60, Base60>;
foodb60 = foobd60;


class Base61 {}
class Derived61 extends Base61 {}
class C61 {
  fooBB61<T61>(p: T61): T61 {return p};
  fooBD61<T61, G61 extends T61>(p: T61): G61 {return p as G61};
  fooDB61<G61 extends T61, T61>(p: G61): T61 { return p as T61};
  fooDD61<G61 extends T61, T61>(p: G61): G61 { return p};
  fooBBN61<T61>(p: T61, n: number): T61 {return p};
  fooBDN61<T61, G61 extends T61>(p: T61, n: number): G61 {return p as G61};
  fooDBN61<G61 extends T61, T61>(p: G61, n: number): T61 { return p as T61};
  fooDDN61<G61 extends T61, T61>(p: G61, n: number): G61 { return p};
  fooBBO61<T61>(p: T61, n?: number): T61 {return p};
  fooBDO61<T61, G61 extends T61>(p: T61, n?: number): G61 {return p as G61};
  fooDBO61<G61 extends T61, T61>(p: G61, n?: number): T61 { return p as T61};
  fooDDO61<G61 extends T61, T61>(p: G61, n?: number): G61 { return p};
  fooBBR61<T61>(p: T61, ...n: number[]): T61 {return p};
  fooBDR61<T61, G61 extends T61>(p: T61, ...n: number[]): G61 {return p as G61};
  fooDBR61<G61 extends T61, T61>(p: G61, ...n: number[]): T61 { return p as T61};
  fooDDR61<G61 extends T61, T61>(p: G61, ...n: number[]): G61 { return p};
}
const c61: C61 = new C61()
let foobb61: (p: Base61) => Base61 = c61.fooBB61<Base61>;
let foobd61: (p: Base61) => Derived61 = c61.fooBD61<Base61, Derived61>;
let foodb61: (p: Derived61) => Base61 = c61.fooDB61<Derived61, Base61>;
let foodd61: (p: Derived61) => Derived61 = c61.fooDD61<Derived61, Base61>;
let foobbn61: (p: Base61, n: number) => Base61 = c61.fooBBN61<Base61>;
let foobdn61: (p: Base61, n: number) => Derived61 = c61.fooBDN61<Base61, Derived61>;
let foodbn61: (p: Derived61, n: number) => Base61 = c61.fooDBN61<Derived61, Base61>;
let fooddn61: (p: Derived61, n: number) => Derived61 = c61.fooDDN61<Derived61, Base61>;
let foobbo61: (p: Base61, n?: number) => Base61 = c61.fooBBO61<Base61>;
let foobdo61: (p: Base61, n?: number) => Derived61 = c61.fooBDO61<Base61, Derived61>;
let foodbo61: (p: Derived61, n?: number) => Base61 = c61.fooDBO61<Derived61, Base61>;
let fooddo61: (p: Derived61, n?: number) => Derived61 = c61.fooDDO61<Derived61, Base61>;
let foobbr61: (p: Base61, ...n: number[]) => Base61 = c61.fooBBR61<Base61>;
let foobdr61: (p: Base61, ...n: number[]) => Derived61 = c61.fooBDR61<Base61, Derived61>;
let foodbr61: (p: Derived61, ...n: number[]) => Base61 = c61.fooDBR61<Derived61, Base61>;
let fooddr61: (p: Derived61, ...n: number[]) => Derived61 = c61.fooDDR61<Derived61, Base61>;
foodb61 = foodd61;


class Base62 {}
class Derived62 extends Base62 {}
class C62 {
  fooBB62<T62>(p: T62): T62 {return p};
  fooBD62<T62, G62 extends T62>(p: T62): G62 {return p as G62};
  fooDB62<G62 extends T62, T62>(p: G62): T62 { return p as T62};
  fooDD62<G62 extends T62, T62>(p: G62): G62 { return p};
  fooBBN62<T62>(p: T62, n: number): T62 {return p};
  fooBDN62<T62, G62 extends T62>(p: T62, n: number): G62 {return p as G62};
  fooDBN62<G62 extends T62, T62>(p: G62, n: number): T62 { return p as T62};
  fooDDN62<G62 extends T62, T62>(p: G62, n: number): G62 { return p};
  fooBBO62<T62>(p: T62, n?: number): T62 {return p};
  fooBDO62<T62, G62 extends T62>(p: T62, n?: number): G62 {return p as G62};
  fooDBO62<G62 extends T62, T62>(p: G62, n?: number): T62 { return p as T62};
  fooDDO62<G62 extends T62, T62>(p: G62, n?: number): G62 { return p};
  fooBBR62<T62>(p: T62, ...n: number[]): T62 {return p};
  fooBDR62<T62, G62 extends T62>(p: T62, ...n: number[]): G62 {return p as G62};
  fooDBR62<G62 extends T62, T62>(p: G62, ...n: number[]): T62 { return p as T62};
  fooDDR62<G62 extends T62, T62>(p: G62, ...n: number[]): G62 { return p};
}
const c62: C62 = new C62()
let foobb62: (p: Base62) => Base62 = c62.fooBB62<Base62>;
let foobd62: (p: Base62) => Derived62 = c62.fooBD62<Base62, Derived62>;
let foodb62: (p: Derived62) => Base62 = c62.fooDB62<Derived62, Base62>;
let foodd62: (p: Derived62) => Derived62 = c62.fooDD62<Derived62, Base62>;
let foobbn62: (p: Base62, n: number) => Base62 = c62.fooBBN62<Base62>;
let foobdn62: (p: Base62, n: number) => Derived62 = c62.fooBDN62<Base62, Derived62>;
let foodbn62: (p: Derived62, n: number) => Base62 = c62.fooDBN62<Derived62, Base62>;
let fooddn62: (p: Derived62, n: number) => Derived62 = c62.fooDDN62<Derived62, Base62>;
let foobbo62: (p: Base62, n?: number) => Base62 = c62.fooBBO62<Base62>;
let foobdo62: (p: Base62, n?: number) => Derived62 = c62.fooBDO62<Base62, Derived62>;
let foodbo62: (p: Derived62, n?: number) => Base62 = c62.fooDBO62<Derived62, Base62>;
let fooddo62: (p: Derived62, n?: number) => Derived62 = c62.fooDDO62<Derived62, Base62>;
let foobbr62: (p: Base62, ...n: number[]) => Base62 = c62.fooBBR62<Base62>;
let foobdr62: (p: Base62, ...n: number[]) => Derived62 = c62.fooBDR62<Base62, Derived62>;
let foodbr62: (p: Derived62, ...n: number[]) => Base62 = c62.fooDBR62<Derived62, Base62>;
let fooddr62: (p: Derived62, ...n: number[]) => Derived62 = c62.fooDDR62<Derived62, Base62>;
foodd62 = foobd62;


class Base63 {}
class Derived63 extends Base63 {}
class C63 {
  fooBB63<T63>(p: T63): T63 {return p};
  fooBD63<T63, G63 extends T63>(p: T63): G63 {return p as G63};
  fooDB63<G63 extends T63, T63>(p: G63): T63 { return p as T63};
  fooDD63<G63 extends T63, T63>(p: G63): G63 { return p};
  fooBBN63<T63>(p: T63, n: number): T63 {return p};
  fooBDN63<T63, G63 extends T63>(p: T63, n: number): G63 {return p as G63};
  fooDBN63<G63 extends T63, T63>(p: G63, n: number): T63 { return p as T63};
  fooDDN63<G63 extends T63, T63>(p: G63, n: number): G63 { return p};
  fooBBO63<T63>(p: T63, n?: number): T63 {return p};
  fooBDO63<T63, G63 extends T63>(p: T63, n?: number): G63 {return p as G63};
  fooDBO63<G63 extends T63, T63>(p: G63, n?: number): T63 { return p as T63};
  fooDDO63<G63 extends T63, T63>(p: G63, n?: number): G63 { return p};
  fooBBR63<T63>(p: T63, ...n: number[]): T63 {return p};
  fooBDR63<T63, G63 extends T63>(p: T63, ...n: number[]): G63 {return p as G63};
  fooDBR63<G63 extends T63, T63>(p: G63, ...n: number[]): T63 { return p as T63};
  fooDDR63<G63 extends T63, T63>(p: G63, ...n: number[]): G63 { return p};
}
const c63: C63 = new C63()
let foobb63: (p: Base63) => Base63 = c63.fooBB63<Base63>;
let foobd63: (p: Base63) => Derived63 = c63.fooBD63<Base63, Derived63>;
let foodb63: (p: Derived63) => Base63 = c63.fooDB63<Derived63, Base63>;
let foodd63: (p: Derived63) => Derived63 = c63.fooDD63<Derived63, Base63>;
let foobbn63: (p: Base63, n: number) => Base63 = c63.fooBBN63<Base63>;
let foobdn63: (p: Base63, n: number) => Derived63 = c63.fooBDN63<Base63, Derived63>;
let foodbn63: (p: Derived63, n: number) => Base63 = c63.fooDBN63<Derived63, Base63>;
let fooddn63: (p: Derived63, n: number) => Derived63 = c63.fooDDN63<Derived63, Base63>;
let foobbo63: (p: Base63, n?: number) => Base63 = c63.fooBBO63<Base63>;
let foobdo63: (p: Base63, n?: number) => Derived63 = c63.fooBDO63<Base63, Derived63>;
let foodbo63: (p: Derived63, n?: number) => Base63 = c63.fooDBO63<Derived63, Base63>;
let fooddo63: (p: Derived63, n?: number) => Derived63 = c63.fooDDO63<Derived63, Base63>;
let foobbr63: (p: Base63, ...n: number[]) => Base63 = c63.fooBBR63<Base63>;
let foobdr63: (p: Base63, ...n: number[]) => Derived63 = c63.fooBDR63<Base63, Derived63>;
let foodbr63: (p: Derived63, ...n: number[]) => Base63 = c63.fooDBR63<Derived63, Base63>;
let fooddr63: (p: Derived63, ...n: number[]) => Derived63 = c63.fooDDR63<Derived63, Base63>;
foobbn63 = foobb63;


class Base64 {}
class Derived64 extends Base64 {}
class C64 {
  fooBB64<T64>(p: T64): T64 {return p};
  fooBD64<T64, G64 extends T64>(p: T64): G64 {return p as G64};
  fooDB64<G64 extends T64, T64>(p: G64): T64 { return p as T64};
  fooDD64<G64 extends T64, T64>(p: G64): G64 { return p};
  fooBBN64<T64>(p: T64, n: number): T64 {return p};
  fooBDN64<T64, G64 extends T64>(p: T64, n: number): G64 {return p as G64};
  fooDBN64<G64 extends T64, T64>(p: G64, n: number): T64 { return p as T64};
  fooDDN64<G64 extends T64, T64>(p: G64, n: number): G64 { return p};
  fooBBO64<T64>(p: T64, n?: number): T64 {return p};
  fooBDO64<T64, G64 extends T64>(p: T64, n?: number): G64 {return p as G64};
  fooDBO64<G64 extends T64, T64>(p: G64, n?: number): T64 { return p as T64};
  fooDDO64<G64 extends T64, T64>(p: G64, n?: number): G64 { return p};
  fooBBR64<T64>(p: T64, ...n: number[]): T64 {return p};
  fooBDR64<T64, G64 extends T64>(p: T64, ...n: number[]): G64 {return p as G64};
  fooDBR64<G64 extends T64, T64>(p: G64, ...n: number[]): T64 { return p as T64};
  fooDDR64<G64 extends T64, T64>(p: G64, ...n: number[]): G64 { return p};
}
const c64: C64 = new C64()
let foobb64: (p: Base64) => Base64 = c64.fooBB64<Base64>;
let foobd64: (p: Base64) => Derived64 = c64.fooBD64<Base64, Derived64>;
let foodb64: (p: Derived64) => Base64 = c64.fooDB64<Derived64, Base64>;
let foodd64: (p: Derived64) => Derived64 = c64.fooDD64<Derived64, Base64>;
let foobbn64: (p: Base64, n: number) => Base64 = c64.fooBBN64<Base64>;
let foobdn64: (p: Base64, n: number) => Derived64 = c64.fooBDN64<Base64, Derived64>;
let foodbn64: (p: Derived64, n: number) => Base64 = c64.fooDBN64<Derived64, Base64>;
let fooddn64: (p: Derived64, n: number) => Derived64 = c64.fooDDN64<Derived64, Base64>;
let foobbo64: (p: Base64, n?: number) => Base64 = c64.fooBBO64<Base64>;
let foobdo64: (p: Base64, n?: number) => Derived64 = c64.fooBDO64<Base64, Derived64>;
let foodbo64: (p: Derived64, n?: number) => Base64 = c64.fooDBO64<Derived64, Base64>;
let fooddo64: (p: Derived64, n?: number) => Derived64 = c64.fooDDO64<Derived64, Base64>;
let foobbr64: (p: Base64, ...n: number[]) => Base64 = c64.fooBBR64<Base64>;
let foobdr64: (p: Base64, ...n: number[]) => Derived64 = c64.fooBDR64<Base64, Derived64>;
let foodbr64: (p: Derived64, ...n: number[]) => Base64 = c64.fooDBR64<Derived64, Base64>;
let fooddr64: (p: Derived64, ...n: number[]) => Derived64 = c64.fooDDR64<Derived64, Base64>;
foobbo64 = foobb64;


class Base65 {}
class Derived65 extends Base65 {}
class C65 {
  fooBB65<T65>(p: T65): T65 {return p};
  fooBD65<T65, G65 extends T65>(p: T65): G65 {return p as G65};
  fooDB65<G65 extends T65, T65>(p: G65): T65 { return p as T65};
  fooDD65<G65 extends T65, T65>(p: G65): G65 { return p};
  fooBBN65<T65>(p: T65, n: number): T65 {return p};
  fooBDN65<T65, G65 extends T65>(p: T65, n: number): G65 {return p as G65};
  fooDBN65<G65 extends T65, T65>(p: G65, n: number): T65 { return p as T65};
  fooDDN65<G65 extends T65, T65>(p: G65, n: number): G65 { return p};
  fooBBO65<T65>(p: T65, n?: number): T65 {return p};
  fooBDO65<T65, G65 extends T65>(p: T65, n?: number): G65 {return p as G65};
  fooDBO65<G65 extends T65, T65>(p: G65, n?: number): T65 { return p as T65};
  fooDDO65<G65 extends T65, T65>(p: G65, n?: number): G65 { return p};
  fooBBR65<T65>(p: T65, ...n: number[]): T65 {return p};
  fooBDR65<T65, G65 extends T65>(p: T65, ...n: number[]): G65 {return p as G65};
  fooDBR65<G65 extends T65, T65>(p: G65, ...n: number[]): T65 { return p as T65};
  fooDDR65<G65 extends T65, T65>(p: G65, ...n: number[]): G65 { return p};
}
const c65: C65 = new C65()
let foobb65: (p: Base65) => Base65 = c65.fooBB65<Base65>;
let foobd65: (p: Base65) => Derived65 = c65.fooBD65<Base65, Derived65>;
let foodb65: (p: Derived65) => Base65 = c65.fooDB65<Derived65, Base65>;
let foodd65: (p: Derived65) => Derived65 = c65.fooDD65<Derived65, Base65>;
let foobbn65: (p: Base65, n: number) => Base65 = c65.fooBBN65<Base65>;
let foobdn65: (p: Base65, n: number) => Derived65 = c65.fooBDN65<Base65, Derived65>;
let foodbn65: (p: Derived65, n: number) => Base65 = c65.fooDBN65<Derived65, Base65>;
let fooddn65: (p: Derived65, n: number) => Derived65 = c65.fooDDN65<Derived65, Base65>;
let foobbo65: (p: Base65, n?: number) => Base65 = c65.fooBBO65<Base65>;
let foobdo65: (p: Base65, n?: number) => Derived65 = c65.fooBDO65<Base65, Derived65>;
let foodbo65: (p: Derived65, n?: number) => Base65 = c65.fooDBO65<Derived65, Base65>;
let fooddo65: (p: Derived65, n?: number) => Derived65 = c65.fooDDO65<Derived65, Base65>;
let foobbr65: (p: Base65, ...n: number[]) => Base65 = c65.fooBBR65<Base65>;
let foobdr65: (p: Base65, ...n: number[]) => Derived65 = c65.fooBDR65<Base65, Derived65>;
let foodbr65: (p: Derived65, ...n: number[]) => Base65 = c65.fooDBR65<Derived65, Base65>;
let fooddr65: (p: Derived65, ...n: number[]) => Derived65 = c65.fooDDR65<Derived65, Base65>;
foobbn65 = foobd65;


class Base66 {}
class Derived66 extends Base66 {}
class C66 {
  fooBB66<T66>(p: T66): T66 {return p};
  fooBD66<T66, G66 extends T66>(p: T66): G66 {return p as G66};
  fooDB66<G66 extends T66, T66>(p: G66): T66 { return p as T66};
  fooDD66<G66 extends T66, T66>(p: G66): G66 { return p};
  fooBBN66<T66>(p: T66, n: number): T66 {return p};
  fooBDN66<T66, G66 extends T66>(p: T66, n: number): G66 {return p as G66};
  fooDBN66<G66 extends T66, T66>(p: G66, n: number): T66 { return p as T66};
  fooDDN66<G66 extends T66, T66>(p: G66, n: number): G66 { return p};
  fooBBO66<T66>(p: T66, n?: number): T66 {return p};
  fooBDO66<T66, G66 extends T66>(p: T66, n?: number): G66 {return p as G66};
  fooDBO66<G66 extends T66, T66>(p: G66, n?: number): T66 { return p as T66};
  fooDDO66<G66 extends T66, T66>(p: G66, n?: number): G66 { return p};
  fooBBR66<T66>(p: T66, ...n: number[]): T66 {return p};
  fooBDR66<T66, G66 extends T66>(p: T66, ...n: number[]): G66 {return p as G66};
  fooDBR66<G66 extends T66, T66>(p: G66, ...n: number[]): T66 { return p as T66};
  fooDDR66<G66 extends T66, T66>(p: G66, ...n: number[]): G66 { return p};
}
const c66: C66 = new C66()
let foobb66: (p: Base66) => Base66 = c66.fooBB66<Base66>;
let foobd66: (p: Base66) => Derived66 = c66.fooBD66<Base66, Derived66>;
let foodb66: (p: Derived66) => Base66 = c66.fooDB66<Derived66, Base66>;
let foodd66: (p: Derived66) => Derived66 = c66.fooDD66<Derived66, Base66>;
let foobbn66: (p: Base66, n: number) => Base66 = c66.fooBBN66<Base66>;
let foobdn66: (p: Base66, n: number) => Derived66 = c66.fooBDN66<Base66, Derived66>;
let foodbn66: (p: Derived66, n: number) => Base66 = c66.fooDBN66<Derived66, Base66>;
let fooddn66: (p: Derived66, n: number) => Derived66 = c66.fooDDN66<Derived66, Base66>;
let foobbo66: (p: Base66, n?: number) => Base66 = c66.fooBBO66<Base66>;
let foobdo66: (p: Base66, n?: number) => Derived66 = c66.fooBDO66<Base66, Derived66>;
let foodbo66: (p: Derived66, n?: number) => Base66 = c66.fooDBO66<Derived66, Base66>;
let fooddo66: (p: Derived66, n?: number) => Derived66 = c66.fooDDO66<Derived66, Base66>;
let foobbr66: (p: Base66, ...n: number[]) => Base66 = c66.fooBBR66<Base66>;
let foobdr66: (p: Base66, ...n: number[]) => Derived66 = c66.fooBDR66<Base66, Derived66>;
let foodbr66: (p: Derived66, ...n: number[]) => Base66 = c66.fooDBR66<Derived66, Base66>;
let fooddr66: (p: Derived66, ...n: number[]) => Derived66 = c66.fooDDR66<Derived66, Base66>;
foobbo66 = foobd66;


class Base67 {}
class Derived67 extends Base67 {}
class C67 {
  fooBB67<T67>(p: T67): T67 {return p};
  fooBD67<T67, G67 extends T67>(p: T67): G67 {return p as G67};
  fooDB67<G67 extends T67, T67>(p: G67): T67 { return p as T67};
  fooDD67<G67 extends T67, T67>(p: G67): G67 { return p};
  fooBBN67<T67>(p: T67, n: number): T67 {return p};
  fooBDN67<T67, G67 extends T67>(p: T67, n: number): G67 {return p as G67};
  fooDBN67<G67 extends T67, T67>(p: G67, n: number): T67 { return p as T67};
  fooDDN67<G67 extends T67, T67>(p: G67, n: number): G67 { return p};
  fooBBO67<T67>(p: T67, n?: number): T67 {return p};
  fooBDO67<T67, G67 extends T67>(p: T67, n?: number): G67 {return p as G67};
  fooDBO67<G67 extends T67, T67>(p: G67, n?: number): T67 { return p as T67};
  fooDDO67<G67 extends T67, T67>(p: G67, n?: number): G67 { return p};
  fooBBR67<T67>(p: T67, ...n: number[]): T67 {return p};
  fooBDR67<T67, G67 extends T67>(p: T67, ...n: number[]): G67 {return p as G67};
  fooDBR67<G67 extends T67, T67>(p: G67, ...n: number[]): T67 { return p as T67};
  fooDDR67<G67 extends T67, T67>(p: G67, ...n: number[]): G67 { return p};
}
const c67: C67 = new C67()
let foobb67: (p: Base67) => Base67 = c67.fooBB67<Base67>;
let foobd67: (p: Base67) => Derived67 = c67.fooBD67<Base67, Derived67>;
let foodb67: (p: Derived67) => Base67 = c67.fooDB67<Derived67, Base67>;
let foodd67: (p: Derived67) => Derived67 = c67.fooDD67<Derived67, Base67>;
let foobbn67: (p: Base67, n: number) => Base67 = c67.fooBBN67<Base67>;
let foobdn67: (p: Base67, n: number) => Derived67 = c67.fooBDN67<Base67, Derived67>;
let foodbn67: (p: Derived67, n: number) => Base67 = c67.fooDBN67<Derived67, Base67>;
let fooddn67: (p: Derived67, n: number) => Derived67 = c67.fooDDN67<Derived67, Base67>;
let foobbo67: (p: Base67, n?: number) => Base67 = c67.fooBBO67<Base67>;
let foobdo67: (p: Base67, n?: number) => Derived67 = c67.fooBDO67<Base67, Derived67>;
let foodbo67: (p: Derived67, n?: number) => Base67 = c67.fooDBO67<Derived67, Base67>;
let fooddo67: (p: Derived67, n?: number) => Derived67 = c67.fooDDO67<Derived67, Base67>;
let foobbr67: (p: Base67, ...n: number[]) => Base67 = c67.fooBBR67<Base67>;
let foobdr67: (p: Base67, ...n: number[]) => Derived67 = c67.fooBDR67<Base67, Derived67>;
let foodbr67: (p: Derived67, ...n: number[]) => Base67 = c67.fooDBR67<Derived67, Base67>;
let fooddr67: (p: Derived67, ...n: number[]) => Derived67 = c67.fooDDR67<Derived67, Base67>;
foodbn67 = foobd67;


class Base68 {}
class Derived68 extends Base68 {}
class C68 {
  fooBB68<T68>(p: T68): T68 {return p};
  fooBD68<T68, G68 extends T68>(p: T68): G68 {return p as G68};
  fooDB68<G68 extends T68, T68>(p: G68): T68 { return p as T68};
  fooDD68<G68 extends T68, T68>(p: G68): G68 { return p};
  fooBBN68<T68>(p: T68, n: number): T68 {return p};
  fooBDN68<T68, G68 extends T68>(p: T68, n: number): G68 {return p as G68};
  fooDBN68<G68 extends T68, T68>(p: G68, n: number): T68 { return p as T68};
  fooDDN68<G68 extends T68, T68>(p: G68, n: number): G68 { return p};
  fooBBO68<T68>(p: T68, n?: number): T68 {return p};
  fooBDO68<T68, G68 extends T68>(p: T68, n?: number): G68 {return p as G68};
  fooDBO68<G68 extends T68, T68>(p: G68, n?: number): T68 { return p as T68};
  fooDDO68<G68 extends T68, T68>(p: G68, n?: number): G68 { return p};
  fooBBR68<T68>(p: T68, ...n: number[]): T68 {return p};
  fooBDR68<T68, G68 extends T68>(p: T68, ...n: number[]): G68 {return p as G68};
  fooDBR68<G68 extends T68, T68>(p: G68, ...n: number[]): T68 { return p as T68};
  fooDDR68<G68 extends T68, T68>(p: G68, ...n: number[]): G68 { return p};
}
const c68: C68 = new C68()
let foobb68: (p: Base68) => Base68 = c68.fooBB68<Base68>;
let foobd68: (p: Base68) => Derived68 = c68.fooBD68<Base68, Derived68>;
let foodb68: (p: Derived68) => Base68 = c68.fooDB68<Derived68, Base68>;
let foodd68: (p: Derived68) => Derived68 = c68.fooDD68<Derived68, Base68>;
let foobbn68: (p: Base68, n: number) => Base68 = c68.fooBBN68<Base68>;
let foobdn68: (p: Base68, n: number) => Derived68 = c68.fooBDN68<Base68, Derived68>;
let foodbn68: (p: Derived68, n: number) => Base68 = c68.fooDBN68<Derived68, Base68>;
let fooddn68: (p: Derived68, n: number) => Derived68 = c68.fooDDN68<Derived68, Base68>;
let foobbo68: (p: Base68, n?: number) => Base68 = c68.fooBBO68<Base68>;
let foobdo68: (p: Base68, n?: number) => Derived68 = c68.fooBDO68<Base68, Derived68>;
let foodbo68: (p: Derived68, n?: number) => Base68 = c68.fooDBO68<Derived68, Base68>;
let fooddo68: (p: Derived68, n?: number) => Derived68 = c68.fooDDO68<Derived68, Base68>;
let foobbr68: (p: Base68, ...n: number[]) => Base68 = c68.fooBBR68<Base68>;
let foobdr68: (p: Base68, ...n: number[]) => Derived68 = c68.fooBDR68<Base68, Derived68>;
let foodbr68: (p: Derived68, ...n: number[]) => Base68 = c68.fooDBR68<Derived68, Base68>;
let fooddr68: (p: Derived68, ...n: number[]) => Derived68 = c68.fooDDR68<Derived68, Base68>;
foodbo68 = foobd68;


class Base69 {}
class Derived69 extends Base69 {}
class C69 {
  fooBB69<T69>(p: T69): T69 {return p};
  fooBD69<T69, G69 extends T69>(p: T69): G69 {return p as G69};
  fooDB69<G69 extends T69, T69>(p: G69): T69 { return p as T69};
  fooDD69<G69 extends T69, T69>(p: G69): G69 { return p};
  fooBBN69<T69>(p: T69, n: number): T69 {return p};
  fooBDN69<T69, G69 extends T69>(p: T69, n: number): G69 {return p as G69};
  fooDBN69<G69 extends T69, T69>(p: G69, n: number): T69 { return p as T69};
  fooDDN69<G69 extends T69, T69>(p: G69, n: number): G69 { return p};
  fooBBO69<T69>(p: T69, n?: number): T69 {return p};
  fooBDO69<T69, G69 extends T69>(p: T69, n?: number): G69 {return p as G69};
  fooDBO69<G69 extends T69, T69>(p: G69, n?: number): T69 { return p as T69};
  fooDDO69<G69 extends T69, T69>(p: G69, n?: number): G69 { return p};
  fooBBR69<T69>(p: T69, ...n: number[]): T69 {return p};
  fooBDR69<T69, G69 extends T69>(p: T69, ...n: number[]): G69 {return p as G69};
  fooDBR69<G69 extends T69, T69>(p: G69, ...n: number[]): T69 { return p as T69};
  fooDDR69<G69 extends T69, T69>(p: G69, ...n: number[]): G69 { return p};
}
const c69: C69 = new C69()
let foobb69: (p: Base69) => Base69 = c69.fooBB69<Base69>;
let foobd69: (p: Base69) => Derived69 = c69.fooBD69<Base69, Derived69>;
let foodb69: (p: Derived69) => Base69 = c69.fooDB69<Derived69, Base69>;
let foodd69: (p: Derived69) => Derived69 = c69.fooDD69<Derived69, Base69>;
let foobbn69: (p: Base69, n: number) => Base69 = c69.fooBBN69<Base69>;
let foobdn69: (p: Base69, n: number) => Derived69 = c69.fooBDN69<Base69, Derived69>;
let foodbn69: (p: Derived69, n: number) => Base69 = c69.fooDBN69<Derived69, Base69>;
let fooddn69: (p: Derived69, n: number) => Derived69 = c69.fooDDN69<Derived69, Base69>;
let foobbo69: (p: Base69, n?: number) => Base69 = c69.fooBBO69<Base69>;
let foobdo69: (p: Base69, n?: number) => Derived69 = c69.fooBDO69<Base69, Derived69>;
let foodbo69: (p: Derived69, n?: number) => Base69 = c69.fooDBO69<Derived69, Base69>;
let fooddo69: (p: Derived69, n?: number) => Derived69 = c69.fooDDO69<Derived69, Base69>;
let foobbr69: (p: Base69, ...n: number[]) => Base69 = c69.fooBBR69<Base69>;
let foobdr69: (p: Base69, ...n: number[]) => Derived69 = c69.fooBDR69<Base69, Derived69>;
let foodbr69: (p: Derived69, ...n: number[]) => Base69 = c69.fooDBR69<Derived69, Base69>;
let fooddr69: (p: Derived69, ...n: number[]) => Derived69 = c69.fooDDR69<Derived69, Base69>;
foodbn69 = fooddn69;

export default function SubtypingForFunctionTypesTest01(): void {
  describe('SubtypingForFunctionTypesTest01', () => {
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
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_4500
     * @tc.name      testPositiveInstanceMethod0045
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethod0045';

      expect(foobbn45(new Base45, 1) instanceof Derived45).assertTrue()
      expect(foobbn45(new Base45, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_4600
     * @tc.name      testPositiveInstanceMethod0046
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethod0046';

      expect(foobbo46(new Base46) instanceof Derived46).assertTrue()
      expect(foobbo46(new Base46).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_4700
     * @tc.name      testPositiveInstanceMethod0047
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethod0047';

      expect(foodbn47(new Derived47, 1) instanceof Derived47).assertTrue()
      expect(foodbn47(new Derived47, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_4800
     * @tc.name      testPositiveInstanceMethod0048
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethod0048';

      expect(foodbo48(new Derived48) instanceof Derived48).assertTrue()
      expect(foodbo48(new Derived48).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_4900
     * @tc.name      testPositiveInstanceMethod0049
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethod0049';

      expect(foodbn49(new Derived49, 1) instanceof Derived49).assertTrue()
      expect(foodbn49(new Derived49, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_5000
     * @tc.name      testPositiveInstanceMethod0050
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethod0050';

      expect(foodbo50(new Derived50) instanceof Derived50).assertTrue()
      expect(foodbo50(new Derived50).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_5100
     * @tc.name      testPositiveInstanceMethod0051
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethod0051';

      expect(foodbr51(new Derived51, 1, 2, 3) instanceof Derived51).assertTrue()
      expect(foodbr51(new Derived51, 1, 2, 3).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_5200
     * @tc.name      testPositiveInstanceMethod0052
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethod0052';

      expect(foodbn52(new Derived52, 1) instanceof Derived52).assertTrue()
      expect(foodbn52(new Derived52, 1).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_5300
     * @tc.name      testPositiveInstanceMethod0053
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethod0053';

      expect(foodbo53(new Derived53) instanceof Derived53).assertTrue()
      expect(foodbo53(new Derived53).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_5400
     * @tc.name      testPositiveInstanceMethod0054
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethod0054';

      expect(foodbo54(new Derived54) instanceof Derived54).assertTrue()
      expect(foodbo54(new Derived54).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_5500
     * @tc.name      testPositiveInstanceMethod0055
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethod0055';

      expect(foodbr55(new Derived55, 1, 2, 3) instanceof Derived55).assertTrue()
      expect(foodbr55(new Derived55, 1, 2, 3).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_5600
     * @tc.name      testPositiveInstanceMethod0056
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethod0056';

      let r = foodbn56.unsafeCall(new Base56, 1.0)
      expect(r instanceof Base56).assertTrue()
      expect((r as Base56).b).assertEqual('b')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_5700
     * @tc.name      testPositiveInstanceMethod0057
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethod0057';

      let r = foodbo57.unsafeCall(new Base57)
      expect(r instanceof Base57).assertTrue()
      expect((r as Base57).b).assertEqual('b')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_5800
     * @tc.name      testPositiveInstanceMethod0058
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethod0058';

      let r = foodbr58.unsafeCall(new Base58, 1.0, 2.0, 3.0)
      expect(r instanceof Base58).assertTrue()
      expect((r as Base58).b).assertEqual('b')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_5900
     * @tc.name      testPositiveInstanceMethodGeneric0059
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
    it("testPositiveInstanceMethodGeneric0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0059';

      expect(foobb59(new Derived59) instanceof Base59).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_6000
     * @tc.name      testPositiveInstanceMethodGeneric0060
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
    it("testPositiveInstanceMethodGeneric0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0060';

      expect(foodb60(new Derived60) instanceof Derived60).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_6100
     * @tc.name      testPositiveInstanceMethodGeneric0061
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
    it("testPositiveInstanceMethodGeneric0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0061';

      expect(foodb61(new Derived61) instanceof Derived61).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_6200
     * @tc.name      testPositiveInstanceMethodGeneric0062
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
    it("testPositiveInstanceMethodGeneric0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0062';

      expect(foodd62(new Derived62) instanceof Base62).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_6300
     * @tc.name      testPositiveInstanceMethodGeneric0063
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
    it("testPositiveInstanceMethodGeneric0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0063';

      expect(foobbn63(new Base63, 1) instanceof Base63).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_6400
     * @tc.name      testPositiveInstanceMethodGeneric0064
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
    it("testPositiveInstanceMethodGeneric0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0064';

      expect(foobbo64(new Base64) instanceof Base64).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_6500
     * @tc.name      testPositiveInstanceMethodGeneric0065
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
    it("testPositiveInstanceMethodGeneric0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0065';

      expect(foobbn65(new Derived65, 1) instanceof Base65).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_6600
     * @tc.name      testPositiveInstanceMethodGeneric0066
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
    it("testPositiveInstanceMethodGeneric0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0066';

      expect(foobbo66(new Derived66) instanceof Base66).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_6700
     * @tc.name      testPositiveInstanceMethodGeneric0067
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
    it("testPositiveInstanceMethodGeneric0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0067';

      expect(foodbn67(new Derived67, 1) instanceof Base67).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_6800
     * @tc.name      testPositiveInstanceMethodGeneric0068
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
    it("testPositiveInstanceMethodGeneric0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0068';

      expect(foodbo68(new Derived68) instanceof Base68).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_6900
     * @tc.name      testPositiveInstanceMethodGeneric0069
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
    it("testPositiveInstanceMethodGeneric0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0069';

      expect(foodbn69(new Derived69, 1) instanceof Derived69).assertTrue()
    })

  })
}