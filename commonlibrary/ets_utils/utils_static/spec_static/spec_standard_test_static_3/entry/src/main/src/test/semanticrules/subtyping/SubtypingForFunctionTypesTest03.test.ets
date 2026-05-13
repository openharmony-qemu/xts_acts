import {
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType
} from '../../../../../hypium/index';

class Base70 {}
class Derived70 extends Base70 {}
class C70 {
  fooBB70<T70>(p: T70): T70 {return p};
  fooBD70<T70, G70 extends T70>(p: T70): G70 {return p as G70};
  fooDB70<G70 extends T70, T70>(p: G70): T70 { return p as T70};
  fooDD70<G70 extends T70, T70>(p: G70): G70 { return p};
  fooBBN70<T70>(p: T70, n: number): T70 {return p};
  fooBDN70<T70, G70 extends T70>(p: T70, n: number): G70 {return p as G70};
  fooDBN70<G70 extends T70, T70>(p: G70, n: number): T70 { return p as T70};
  fooDDN70<G70 extends T70, T70>(p: G70, n: number): G70 { return p};
  fooBBO70<T70>(p: T70, n?: number): T70 {return p};
  fooBDO70<T70, G70 extends T70>(p: T70, n?: number): G70 {return p as G70};
  fooDBO70<G70 extends T70, T70>(p: G70, n?: number): T70 { return p as T70};
  fooDDO70<G70 extends T70, T70>(p: G70, n?: number): G70 { return p};
  fooBBR70<T70>(p: T70, ...n: number[]): T70 {return p};
  fooBDR70<T70, G70 extends T70>(p: T70, ...n: number[]): G70 {return p as G70};
  fooDBR70<G70 extends T70, T70>(p: G70, ...n: number[]): T70 { return p as T70};
  fooDDR70<G70 extends T70, T70>(p: G70, ...n: number[]): G70 { return p};
}
const c70: C70 = new C70()
let foobb70: (p: Base70) => Base70 = c70.fooBB70<Base70>;
let foobd70: (p: Base70) => Derived70 = c70.fooBD70<Base70, Derived70>;
let foodb70: (p: Derived70) => Base70 = c70.fooDB70<Derived70, Base70>;
let foodd70: (p: Derived70) => Derived70 = c70.fooDD70<Derived70, Base70>;
let foobbn70: (p: Base70, n: number) => Base70 = c70.fooBBN70<Base70>;
let foobdn70: (p: Base70, n: number) => Derived70 = c70.fooBDN70<Base70, Derived70>;
let foodbn70: (p: Derived70, n: number) => Base70 = c70.fooDBN70<Derived70, Base70>;
let fooddn70: (p: Derived70, n: number) => Derived70 = c70.fooDDN70<Derived70, Base70>;
let foobbo70: (p: Base70, n?: number) => Base70 = c70.fooBBO70<Base70>;
let foobdo70: (p: Base70, n?: number) => Derived70 = c70.fooBDO70<Base70, Derived70>;
let foodbo70: (p: Derived70, n?: number) => Base70 = c70.fooDBO70<Derived70, Base70>;
let fooddo70: (p: Derived70, n?: number) => Derived70 = c70.fooDDO70<Derived70, Base70>;
let foobbr70: (p: Base70, ...n: number[]) => Base70 = c70.fooBBR70<Base70>;
let foobdr70: (p: Base70, ...n: number[]) => Derived70 = c70.fooBDR70<Base70, Derived70>;
let foodbr70: (p: Derived70, ...n: number[]) => Base70 = c70.fooDBR70<Derived70, Base70>;
let fooddr70: (p: Derived70, ...n: number[]) => Derived70 = c70.fooDDR70<Derived70, Base70>;
foodbo70 = fooddo70;


class Base71 {}
class Derived71 extends Base71 {}
class C71 {
  fooBB71<T71>(p: T71): T71 {return p};
  fooBD71<T71, G71 extends T71>(p: T71): G71 {return p as G71};
  fooDB71<G71 extends T71, T71>(p: G71): T71 { return p as T71};
  fooDD71<G71 extends T71, T71>(p: G71): G71 { return p};
  fooBBN71<T71>(p: T71, n: number): T71 {return p};
  fooBDN71<T71, G71 extends T71>(p: T71, n: number): G71 {return p as G71};
  fooDBN71<G71 extends T71, T71>(p: G71, n: number): T71 { return p as T71};
  fooDDN71<G71 extends T71, T71>(p: G71, n: number): G71 { return p};
  fooBBO71<T71>(p: T71, n?: number): T71 {return p};
  fooBDO71<T71, G71 extends T71>(p: T71, n?: number): G71 {return p as G71};
  fooDBO71<G71 extends T71, T71>(p: G71, n?: number): T71 { return p as T71};
  fooDDO71<G71 extends T71, T71>(p: G71, n?: number): G71 { return p};
  fooBBR71<T71>(p: T71, ...n: number[]): T71 {return p};
  fooBDR71<T71, G71 extends T71>(p: T71, ...n: number[]): G71 {return p as G71};
  fooDBR71<G71 extends T71, T71>(p: G71, ...n: number[]): T71 { return p as T71};
  fooDDR71<G71 extends T71, T71>(p: G71, ...n: number[]): G71 { return p};
}
const c71: C71 = new C71()
let foobb71: (p: Base71) => Base71 = c71.fooBB71<Base71>;
let foobd71: (p: Base71) => Derived71 = c71.fooBD71<Base71, Derived71>;
let foodb71: (p: Derived71) => Base71 = c71.fooDB71<Derived71, Base71>;
let foodd71: (p: Derived71) => Derived71 = c71.fooDD71<Derived71, Base71>;
let foobbn71: (p: Base71, n: number) => Base71 = c71.fooBBN71<Base71>;
let foobdn71: (p: Base71, n: number) => Derived71 = c71.fooBDN71<Base71, Derived71>;
let foodbn71: (p: Derived71, n: number) => Base71 = c71.fooDBN71<Derived71, Base71>;
let fooddn71: (p: Derived71, n: number) => Derived71 = c71.fooDDN71<Derived71, Base71>;
let foobbo71: (p: Base71, n?: number) => Base71 = c71.fooBBO71<Base71>;
let foobdo71: (p: Base71, n?: number) => Derived71 = c71.fooBDO71<Base71, Derived71>;
let foodbo71: (p: Derived71, n?: number) => Base71 = c71.fooDBO71<Derived71, Base71>;
let fooddo71: (p: Derived71, n?: number) => Derived71 = c71.fooDDO71<Derived71, Base71>;
let foobbr71: (p: Base71, ...n: number[]) => Base71 = c71.fooBBR71<Base71>;
let foobdr71: (p: Base71, ...n: number[]) => Derived71 = c71.fooBDR71<Base71, Derived71>;
let foodbr71: (p: Derived71, ...n: number[]) => Base71 = c71.fooDBR71<Derived71, Base71>;
let fooddr71: (p: Derived71, ...n: number[]) => Derived71 = c71.fooDDR71<Derived71, Base71>;
foodbr71 = fooddr71;


class Base72 {}
class Derived72 extends Base72 {}
class C72 {
  fooBB72<T72>(p: T72): T72 {return p};
  fooBD72<T72, G72 extends T72>(p: T72): G72 {return p as G72};
  fooDB72<G72 extends T72, T72>(p: G72): T72 { return p as T72};
  fooDD72<G72 extends T72, T72>(p: G72): G72 { return p};
  fooBBN72<T72>(p: T72, n: number): T72 {return p};
  fooBDN72<T72, G72 extends T72>(p: T72, n: number): G72 {return p as G72};
  fooDBN72<G72 extends T72, T72>(p: G72, n: number): T72 { return p as T72};
  fooDDN72<G72 extends T72, T72>(p: G72, n: number): G72 { return p};
  fooBBO72<T72>(p: T72, n?: number): T72 {return p};
  fooBDO72<T72, G72 extends T72>(p: T72, n?: number): G72 {return p as G72};
  fooDBO72<G72 extends T72, T72>(p: G72, n?: number): T72 { return p as T72};
  fooDDO72<G72 extends T72, T72>(p: G72, n?: number): G72 { return p};
  fooBBR72<T72>(p: T72, ...n: number[]): T72 {return p};
  fooBDR72<T72, G72 extends T72>(p: T72, ...n: number[]): G72 {return p as G72};
  fooDBR72<G72 extends T72, T72>(p: G72, ...n: number[]): T72 { return p as T72};
  fooDDR72<G72 extends T72, T72>(p: G72, ...n: number[]): G72 { return p};
}
const c72: C72 = new C72()
let foobb72: (p: Base72) => Base72 = c72.fooBB72<Base72>;
let foobd72: (p: Base72) => Derived72 = c72.fooBD72<Base72, Derived72>;
let foodb72: (p: Derived72) => Base72 = c72.fooDB72<Derived72, Base72>;
let foodd72: (p: Derived72) => Derived72 = c72.fooDD72<Derived72, Base72>;
let foobbn72: (p: Base72, n: number) => Base72 = c72.fooBBN72<Base72>;
let foobdn72: (p: Base72, n: number) => Derived72 = c72.fooBDN72<Base72, Derived72>;
let foodbn72: (p: Derived72, n: number) => Base72 = c72.fooDBN72<Derived72, Base72>;
let fooddn72: (p: Derived72, n: number) => Derived72 = c72.fooDDN72<Derived72, Base72>;
let foobbo72: (p: Base72, n?: number) => Base72 = c72.fooBBO72<Base72>;
let foobdo72: (p: Base72, n?: number) => Derived72 = c72.fooBDO72<Base72, Derived72>;
let foodbo72: (p: Derived72, n?: number) => Base72 = c72.fooDBO72<Derived72, Base72>;
let fooddo72: (p: Derived72, n?: number) => Derived72 = c72.fooDDO72<Derived72, Base72>;
let foobbr72: (p: Base72, ...n: number[]) => Base72 = c72.fooBBR72<Base72>;
let foobdr72: (p: Base72, ...n: number[]) => Derived72 = c72.fooBDR72<Base72, Derived72>;
let foodbr72: (p: Derived72, ...n: number[]) => Base72 = c72.fooDBR72<Derived72, Base72>;
let fooddr72: (p: Derived72, ...n: number[]) => Derived72 = c72.fooDDR72<Derived72, Base72>;
foodbn72 = foobdn72;


class Base73 {}
class Derived73 extends Base73 {}
class C73 {
  fooBB73<T73>(p: T73): T73 {return p};
  fooBD73<T73, G73 extends T73>(p: T73): G73 {return p as G73};
  fooDB73<G73 extends T73, T73>(p: G73): T73 { return p as T73};
  fooDD73<G73 extends T73, T73>(p: G73): G73 { return p};
  fooBBN73<T73>(p: T73, n: number): T73 {return p};
  fooBDN73<T73, G73 extends T73>(p: T73, n: number): G73 {return p as G73};
  fooDBN73<G73 extends T73, T73>(p: G73, n: number): T73 { return p as T73};
  fooDDN73<G73 extends T73, T73>(p: G73, n: number): G73 { return p};
  fooBBO73<T73>(p: T73, n?: number): T73 {return p};
  fooBDO73<T73, G73 extends T73>(p: T73, n?: number): G73 {return p as G73};
  fooDBO73<G73 extends T73, T73>(p: G73, n?: number): T73 { return p as T73};
  fooDDO73<G73 extends T73, T73>(p: G73, n?: number): G73 { return p};
  fooBBR73<T73>(p: T73, ...n: number[]): T73 {return p};
  fooBDR73<T73, G73 extends T73>(p: T73, ...n: number[]): G73 {return p as G73};
  fooDBR73<G73 extends T73, T73>(p: G73, ...n: number[]): T73 { return p as T73};
  fooDDR73<G73 extends T73, T73>(p: G73, ...n: number[]): G73 { return p};
}
const c73: C73 = new C73()
let foobb73: (p: Base73) => Base73 = c73.fooBB73<Base73>;
let foobd73: (p: Base73) => Derived73 = c73.fooBD73<Base73, Derived73>;
let foodb73: (p: Derived73) => Base73 = c73.fooDB73<Derived73, Base73>;
let foodd73: (p: Derived73) => Derived73 = c73.fooDD73<Derived73, Base73>;
let foobbn73: (p: Base73, n: number) => Base73 = c73.fooBBN73<Base73>;
let foobdn73: (p: Base73, n: number) => Derived73 = c73.fooBDN73<Base73, Derived73>;
let foodbn73: (p: Derived73, n: number) => Base73 = c73.fooDBN73<Derived73, Base73>;
let fooddn73: (p: Derived73, n: number) => Derived73 = c73.fooDDN73<Derived73, Base73>;
let foobbo73: (p: Base73, n?: number) => Base73 = c73.fooBBO73<Base73>;
let foobdo73: (p: Base73, n?: number) => Derived73 = c73.fooBDO73<Base73, Derived73>;
let foodbo73: (p: Derived73, n?: number) => Base73 = c73.fooDBO73<Derived73, Base73>;
let fooddo73: (p: Derived73, n?: number) => Derived73 = c73.fooDDO73<Derived73, Base73>;
let foobbr73: (p: Base73, ...n: number[]) => Base73 = c73.fooBBR73<Base73>;
let foobdr73: (p: Base73, ...n: number[]) => Derived73 = c73.fooBDR73<Base73, Derived73>;
let foodbr73: (p: Derived73, ...n: number[]) => Base73 = c73.fooDBR73<Derived73, Base73>;
let fooddr73: (p: Derived73, ...n: number[]) => Derived73 = c73.fooDDR73<Derived73, Base73>;
foodbo73 = foobdo73;


class Base74 {}
class Derived74 extends Base74 {}
class C74 {
  fooBB74<T74>(p: T74): T74 {return p};
  fooBD74<T74, G74 extends T74>(p: T74): G74 {return p as G74};
  fooDB74<G74 extends T74, T74>(p: G74): T74 { return p as T74};
  fooDD74<G74 extends T74, T74>(p: G74): G74 { return p};
  fooBBN74<T74>(p: T74, n: number): T74 {return p};
  fooBDN74<T74, G74 extends T74>(p: T74, n: number): G74 {return p as G74};
  fooDBN74<G74 extends T74, T74>(p: G74, n: number): T74 { return p as T74};
  fooDDN74<G74 extends T74, T74>(p: G74, n: number): G74 { return p};
  fooBBO74<T74>(p: T74, n?: number): T74 {return p};
  fooBDO74<T74, G74 extends T74>(p: T74, n?: number): G74 {return p as G74};
  fooDBO74<G74 extends T74, T74>(p: G74, n?: number): T74 { return p as T74};
  fooDDO74<G74 extends T74, T74>(p: G74, n?: number): G74 { return p};
  fooBBR74<T74>(p: T74, ...n: number[]): T74 {return p};
  fooBDR74<T74, G74 extends T74>(p: T74, ...n: number[]): G74 {return p as G74};
  fooDBR74<G74 extends T74, T74>(p: G74, ...n: number[]): T74 { return p as T74};
  fooDDR74<G74 extends T74, T74>(p: G74, ...n: number[]): G74 { return p};
}
const c74: C74 = new C74()
let foobb74: (p: Base74) => Base74 = c74.fooBB74<Base74>;
let foobd74: (p: Base74) => Derived74 = c74.fooBD74<Base74, Derived74>;
let foodb74: (p: Derived74) => Base74 = c74.fooDB74<Derived74, Base74>;
let foodd74: (p: Derived74) => Derived74 = c74.fooDD74<Derived74, Base74>;
let foobbn74: (p: Base74, n: number) => Base74 = c74.fooBBN74<Base74>;
let foobdn74: (p: Base74, n: number) => Derived74 = c74.fooBDN74<Base74, Derived74>;
let foodbn74: (p: Derived74, n: number) => Base74 = c74.fooDBN74<Derived74, Base74>;
let fooddn74: (p: Derived74, n: number) => Derived74 = c74.fooDDN74<Derived74, Base74>;
let foobbo74: (p: Base74, n?: number) => Base74 = c74.fooBBO74<Base74>;
let foobdo74: (p: Base74, n?: number) => Derived74 = c74.fooBDO74<Base74, Derived74>;
let foodbo74: (p: Derived74, n?: number) => Base74 = c74.fooDBO74<Derived74, Base74>;
let fooddo74: (p: Derived74, n?: number) => Derived74 = c74.fooDDO74<Derived74, Base74>;
let foobbr74: (p: Base74, ...n: number[]) => Base74 = c74.fooBBR74<Base74>;
let foobdr74: (p: Base74, ...n: number[]) => Derived74 = c74.fooBDR74<Base74, Derived74>;
let foodbr74: (p: Derived74, ...n: number[]) => Base74 = c74.fooDBR74<Derived74, Base74>;
let fooddr74: (p: Derived74, ...n: number[]) => Derived74 = c74.fooDDR74<Derived74, Base74>;
foodbr74 = foobdr74;


class Base75 {}
class Derived75 extends Base75 {}
class C75 {
  fooBB75<T75>(p: T75): T75 {return p};
  fooBD75<T75, G75 extends T75>(p: T75): G75 {return p as G75};
  fooDB75<G75 extends T75, T75>(p: G75): T75 { return p as T75};
  fooDD75<G75 extends T75, T75>(p: G75): G75 { return p};
  fooBBN75<T75>(p: T75, n: number): T75 {return p};
  fooBDN75<T75, G75 extends T75>(p: T75, n: number): G75 {return p as G75};
  fooDBN75<G75 extends T75, T75>(p: G75, n: number): T75 { return p as T75};
  fooDDN75<G75 extends T75, T75>(p: G75, n: number): G75 { return p};
  fooBBO75<T75>(p: T75, n?: number): T75 {return p};
  fooBDO75<T75, G75 extends T75>(p: T75, n?: number): G75 {return p as G75};
  fooDBO75<G75 extends T75, T75>(p: G75, n?: number): T75 { return p as T75};
  fooDDO75<G75 extends T75, T75>(p: G75, n?: number): G75 { return p};
  fooBBR75<T75>(p: T75, ...n: number[]): T75 {return p};
  fooBDR75<T75, G75 extends T75>(p: T75, ...n: number[]): G75 {return p as G75};
  fooDBR75<G75 extends T75, T75>(p: G75, ...n: number[]): T75 { return p as T75};
  fooDDR75<G75 extends T75, T75>(p: G75, ...n: number[]): G75 { return p};
}
const c75: C75 = new C75()
let foobb75: (p: Base75) => Base75 = c75.fooBB75<Base75>;
let foobd75: (p: Base75) => Derived75 = c75.fooBD75<Base75, Derived75>;
let foodb75: (p: Derived75) => Base75 = c75.fooDB75<Derived75, Base75>;
let foodd75: (p: Derived75) => Derived75 = c75.fooDD75<Derived75, Base75>;
let foobbn75: (p: Base75, n: number) => Base75 = c75.fooBBN75<Base75>;
let foobdn75: (p: Base75, n: number) => Derived75 = c75.fooBDN75<Base75, Derived75>;
let foodbn75: (p: Derived75, n: number) => Base75 = c75.fooDBN75<Derived75, Base75>;
let fooddn75: (p: Derived75, n: number) => Derived75 = c75.fooDDN75<Derived75, Base75>;
let foobbo75: (p: Base75, n?: number) => Base75 = c75.fooBBO75<Base75>;
let foobdo75: (p: Base75, n?: number) => Derived75 = c75.fooBDO75<Base75, Derived75>;
let foodbo75: (p: Derived75, n?: number) => Base75 = c75.fooDBO75<Derived75, Base75>;
let fooddo75: (p: Derived75, n?: number) => Derived75 = c75.fooDDO75<Derived75, Base75>;
let foobbr75: (p: Base75, ...n: number[]) => Base75 = c75.fooBBR75<Base75>;
let foobdr75: (p: Base75, ...n: number[]) => Derived75 = c75.fooBDR75<Base75, Derived75>;
let foodbr75: (p: Derived75, ...n: number[]) => Base75 = c75.fooDBR75<Derived75, Base75>;
let fooddr75: (p: Derived75, ...n: number[]) => Derived75 = c75.fooDDR75<Derived75, Base75>;
foodbn75 = foobbn75;


class Base76 {}
class Derived76 extends Base76 {}
class C76 {
  fooBB76<T76>(p: T76): T76 {return p};
  fooBD76<T76, G76 extends T76>(p: T76): G76 {return p as G76};
  fooDB76<G76 extends T76, T76>(p: G76): T76 { return p as T76};
  fooDD76<G76 extends T76, T76>(p: G76): G76 { return p};
  fooBBN76<T76>(p: T76, n: number): T76 {return p};
  fooBDN76<T76, G76 extends T76>(p: T76, n: number): G76 {return p as G76};
  fooDBN76<G76 extends T76, T76>(p: G76, n: number): T76 { return p as T76};
  fooDDN76<G76 extends T76, T76>(p: G76, n: number): G76 { return p};
  fooBBO76<T76>(p: T76, n?: number): T76 {return p};
  fooBDO76<T76, G76 extends T76>(p: T76, n?: number): G76 {return p as G76};
  fooDBO76<G76 extends T76, T76>(p: G76, n?: number): T76 { return p as T76};
  fooDDO76<G76 extends T76, T76>(p: G76, n?: number): G76 { return p};
  fooBBR76<T76>(p: T76, ...n: number[]): T76 {return p};
  fooBDR76<T76, G76 extends T76>(p: T76, ...n: number[]): G76 {return p as G76};
  fooDBR76<G76 extends T76, T76>(p: G76, ...n: number[]): T76 { return p as T76};
  fooDDR76<G76 extends T76, T76>(p: G76, ...n: number[]): G76 { return p};
}
const c76: C76 = new C76()
let foobb76: (p: Base76) => Base76 = c76.fooBB76<Base76>;
let foobd76: (p: Base76) => Derived76 = c76.fooBD76<Base76, Derived76>;
let foodb76: (p: Derived76) => Base76 = c76.fooDB76<Derived76, Base76>;
let foodd76: (p: Derived76) => Derived76 = c76.fooDD76<Derived76, Base76>;
let foobbn76: (p: Base76, n: number) => Base76 = c76.fooBBN76<Base76>;
let foobdn76: (p: Base76, n: number) => Derived76 = c76.fooBDN76<Base76, Derived76>;
let foodbn76: (p: Derived76, n: number) => Base76 = c76.fooDBN76<Derived76, Base76>;
let fooddn76: (p: Derived76, n: number) => Derived76 = c76.fooDDN76<Derived76, Base76>;
let foobbo76: (p: Base76, n?: number) => Base76 = c76.fooBBO76<Base76>;
let foobdo76: (p: Base76, n?: number) => Derived76 = c76.fooBDO76<Base76, Derived76>;
let foodbo76: (p: Derived76, n?: number) => Base76 = c76.fooDBO76<Derived76, Base76>;
let fooddo76: (p: Derived76, n?: number) => Derived76 = c76.fooDDO76<Derived76, Base76>;
let foobbr76: (p: Base76, ...n: number[]) => Base76 = c76.fooBBR76<Base76>;
let foobdr76: (p: Base76, ...n: number[]) => Derived76 = c76.fooBDR76<Base76, Derived76>;
let foodbr76: (p: Derived76, ...n: number[]) => Base76 = c76.fooDBR76<Derived76, Base76>;
let fooddr76: (p: Derived76, ...n: number[]) => Derived76 = c76.fooDDR76<Derived76, Base76>;
foodbo76 = foobbo76;


class Base77 {}
class Derived77 extends Base77 {}
class C77 {
  fooBB77<T77>(p: T77): T77 {return p};
  fooBD77<T77, G77 extends T77>(p: T77): G77 {return p as G77};
  fooDB77<G77 extends T77, T77>(p: G77): T77 { return p as T77};
  fooDD77<G77 extends T77, T77>(p: G77): G77 { return p};
  fooBBN77<T77>(p: T77, n: number): T77 {return p};
  fooBDN77<T77, G77 extends T77>(p: T77, n: number): G77 {return p as G77};
  fooDBN77<G77 extends T77, T77>(p: G77, n: number): T77 { return p as T77};
  fooDDN77<G77 extends T77, T77>(p: G77, n: number): G77 { return p};
  fooBBO77<T77>(p: T77, n?: number): T77 {return p};
  fooBDO77<T77, G77 extends T77>(p: T77, n?: number): G77 {return p as G77};
  fooDBO77<G77 extends T77, T77>(p: G77, n?: number): T77 { return p as T77};
  fooDDO77<G77 extends T77, T77>(p: G77, n?: number): G77 { return p};
  fooBBR77<T77>(p: T77, ...n: number[]): T77 {return p};
  fooBDR77<T77, G77 extends T77>(p: T77, ...n: number[]): G77 {return p as G77};
  fooDBR77<G77 extends T77, T77>(p: G77, ...n: number[]): T77 { return p as T77};
  fooDDR77<G77 extends T77, T77>(p: G77, ...n: number[]): G77 { return p};
}
const c77: C77 = new C77()
let foobb77: (p: Base77) => Base77 = c77.fooBB77<Base77>;
let foobd77: (p: Base77) => Derived77 = c77.fooBD77<Base77, Derived77>;
let foodb77: (p: Derived77) => Base77 = c77.fooDB77<Derived77, Base77>;
let foodd77: (p: Derived77) => Derived77 = c77.fooDD77<Derived77, Base77>;
let foobbn77: (p: Base77, n: number) => Base77 = c77.fooBBN77<Base77>;
let foobdn77: (p: Base77, n: number) => Derived77 = c77.fooBDN77<Base77, Derived77>;
let foodbn77: (p: Derived77, n: number) => Base77 = c77.fooDBN77<Derived77, Base77>;
let fooddn77: (p: Derived77, n: number) => Derived77 = c77.fooDDN77<Derived77, Base77>;
let foobbo77: (p: Base77, n?: number) => Base77 = c77.fooBBO77<Base77>;
let foobdo77: (p: Base77, n?: number) => Derived77 = c77.fooBDO77<Base77, Derived77>;
let foodbo77: (p: Derived77, n?: number) => Base77 = c77.fooDBO77<Derived77, Base77>;
let fooddo77: (p: Derived77, n?: number) => Derived77 = c77.fooDDO77<Derived77, Base77>;
let foobbr77: (p: Base77, ...n: number[]) => Base77 = c77.fooBBR77<Base77>;
let foobdr77: (p: Base77, ...n: number[]) => Derived77 = c77.fooBDR77<Base77, Derived77>;
let foodbr77: (p: Derived77, ...n: number[]) => Base77 = c77.fooDBR77<Derived77, Base77>;
let fooddr77: (p: Derived77, ...n: number[]) => Derived77 = c77.fooDDR77<Derived77, Base77>;
foodbr77 = foobbr77;

class Base78 {
  b: string = 'b';
}
class Derived78 extends Base78 {
  b: string = 'd';
}
interface I78 {
  fooBB78(p: Base78): Base78;
  fooBD78(p: Base78): Derived78;
  fooDB78(p: Derived78): Base78;
  fooDD78(p: Derived78): Derived78;
  fooBBN78(p: Base78, n: number): Base78;
  fooBDN78(p: Base78, n: number): Derived78;
  fooDBN78(p: Derived78, n: number): Base78;
  fooDDN78(p: Derived78, n: number): Derived78;
  fooBBO78(p: Base78, n?: number): Base78;
  fooBDO78(p: Base78, n?: number): Derived78;
  fooDBO78(p: Derived78, n?: number): Base78;
  fooDDO78(p: Derived78, n?: number): Derived78;
  fooBBR78(p: Base78, ...n: number[]): Base78;
  fooBDR78(p: Base78, ...n: number[]): Derived78;
  fooDBR78(p: Derived78, ...n: number[]): Base78;
  fooDDR78(p: Derived78, ...n: number[]): Derived78;
}
class C78 implements I78 {
  fooBB78(p: Base78): Base78 { return p; }
  fooBD78(p: Base78): Derived78 { return new Derived78(); }
  fooDB78(p: Derived78): Base78 { return new Base78(); }
  fooDD78(p: Derived78): Derived78 { return p; }
  fooBBN78(p: Base78, n: number): Base78 { return p; }
  fooBDN78(p: Base78, n: number): Derived78 { return new Derived78(); }
  fooDBN78(p: Derived78, n: number): Base78 { return new Base78(); }
  fooDDN78(p: Derived78, n: number): Derived78 { return p; }
  fooBBO78(p: Base78, n?: number): Base78 { return p; }
  fooBDO78(p: Base78, n?: number): Derived78 { return new Derived78(); }
  fooDBO78(p: Derived78, n?: number): Base78 { return new Base78(); }
  fooDDO78(p: Derived78, n?: number): Derived78 { return p; }
  fooBBR78(p: Base78, ...n: number[]): Base78 { return p; }
  fooBDR78(p: Base78, ...n: number[]): Derived78 { return new Derived78(); }
  fooDBR78(p: Derived78, ...n: number[]): Base78 { return new Base78(); }
  fooDDR78(p: Derived78, ...n: number[]): Derived78 { return p; }
}
const c78: I78 = new C78();
let foobb78 = c78.fooBB78;
let foobd78 = c78.fooBD78;
let foodb78 = c78.fooDB78;
let foodd78 = c78.fooDD78;
let foobbn78 = c78.fooBBN78;
let foobdn78 = c78.fooBDN78;
let foodbn78 = c78.fooDBN78;
let fooddn78 = c78.fooDDN78;
let foobbo78 = c78.fooBBO78;
let foobdo78 = c78.fooBDO78;
let foodbo78 = c78.fooDBO78;
let fooddo78 = c78.fooDDO78;
let foobbr78 = c78.fooBBR78;
let foobdr78 = c78.fooBDR78;
let foodbr78 = c78.fooDBR78;
let fooddr78 = c78.fooDDR78;
foobb78 = foobd78;


class Base79 {
  b: string = 'b';
}
class Derived79 extends Base79 {
  b: string = 'd';
}
interface I79 {
  fooBB79(p: Base79): Base79;
  fooBD79(p: Base79): Derived79;
  fooDB79(p: Derived79): Base79;
  fooDD79(p: Derived79): Derived79;
  fooBBN79(p: Base79, n: number): Base79;
  fooBDN79(p: Base79, n: number): Derived79;
  fooDBN79(p: Derived79, n: number): Base79;
  fooDDN79(p: Derived79, n: number): Derived79;
  fooBBO79(p: Base79, n?: number): Base79;
  fooBDO79(p: Base79, n?: number): Derived79;
  fooDBO79(p: Derived79, n?: number): Base79;
  fooDDO79(p: Derived79, n?: number): Derived79;
  fooBBR79(p: Base79, ...n: number[]): Base79;
  fooBDR79(p: Base79, ...n: number[]): Derived79;
  fooDBR79(p: Derived79, ...n: number[]): Base79;
  fooDDR79(p: Derived79, ...n: number[]): Derived79;
}
class C79 implements I79 {
  fooBB79(p: Base79): Base79 { return p; }
  fooBD79(p: Base79): Derived79 { return new Derived79(); }
  fooDB79(p: Derived79): Base79 { return new Base79(); }
  fooDD79(p: Derived79): Derived79 { return p; }
  fooBBN79(p: Base79, n: number): Base79 { return p; }
  fooBDN79(p: Base79, n: number): Derived79 { return new Derived79(); }
  fooDBN79(p: Derived79, n: number): Base79 { return new Base79(); }
  fooDDN79(p: Derived79, n: number): Derived79 { return p; }
  fooBBO79(p: Base79, n?: number): Base79 { return p; }
  fooBDO79(p: Base79, n?: number): Derived79 { return new Derived79(); }
  fooDBO79(p: Derived79, n?: number): Base79 { return new Base79(); }
  fooDDO79(p: Derived79, n?: number): Derived79 { return p; }
  fooBBR79(p: Base79, ...n: number[]): Base79 { return p; }
  fooBDR79(p: Base79, ...n: number[]): Derived79 { return new Derived79(); }
  fooDBR79(p: Derived79, ...n: number[]): Base79 { return new Base79(); }
  fooDDR79(p: Derived79, ...n: number[]): Derived79 { return p; }
}
const c79: I79 = new C79();
let foobb79 = c79.fooBB79;
let foobd79 = c79.fooBD79;
let foodb79 = c79.fooDB79;
let foodd79 = c79.fooDD79;
let foobbn79 = c79.fooBBN79;
let foobdn79 = c79.fooBDN79;
let foodbn79 = c79.fooDBN79;
let fooddn79 = c79.fooDDN79;
let foobbo79 = c79.fooBBO79;
let foobdo79 = c79.fooBDO79;
let foodbo79 = c79.fooDBO79;
let fooddo79 = c79.fooDDO79;
let foobbr79 = c79.fooBBR79;
let foobdr79 = c79.fooBDR79;
let foodbr79 = c79.fooDBR79;
let fooddr79 = c79.fooDDR79;
foodb79 = foobd79;


class Base80 {
  b: string = 'b';
}
class Derived80 extends Base80 {
  b: string = 'd';
}
interface I80 {
  fooBB80(p: Base80): Base80;
  fooBD80(p: Base80): Derived80;
  fooDB80(p: Derived80): Base80;
  fooDD80(p: Derived80): Derived80;
  fooBBN80(p: Base80, n: number): Base80;
  fooBDN80(p: Base80, n: number): Derived80;
  fooDBN80(p: Derived80, n: number): Base80;
  fooDDN80(p: Derived80, n: number): Derived80;
  fooBBO80(p: Base80, n?: number): Base80;
  fooBDO80(p: Base80, n?: number): Derived80;
  fooDBO80(p: Derived80, n?: number): Base80;
  fooDDO80(p: Derived80, n?: number): Derived80;
  fooBBR80(p: Base80, ...n: number[]): Base80;
  fooBDR80(p: Base80, ...n: number[]): Derived80;
  fooDBR80(p: Derived80, ...n: number[]): Base80;
  fooDDR80(p: Derived80, ...n: number[]): Derived80;
}
class C80 implements I80 {
  fooBB80(p: Base80): Base80 { return p; }
  fooBD80(p: Base80): Derived80 { return new Derived80(); }
  fooDB80(p: Derived80): Base80 { return new Base80(); }
  fooDD80(p: Derived80): Derived80 { return p; }
  fooBBN80(p: Base80, n: number): Base80 { return p; }
  fooBDN80(p: Base80, n: number): Derived80 { return new Derived80(); }
  fooDBN80(p: Derived80, n: number): Base80 { return new Base80(); }
  fooDDN80(p: Derived80, n: number): Derived80 { return p; }
  fooBBO80(p: Base80, n?: number): Base80 { return p; }
  fooBDO80(p: Base80, n?: number): Derived80 { return new Derived80(); }
  fooDBO80(p: Derived80, n?: number): Base80 { return new Base80(); }
  fooDDO80(p: Derived80, n?: number): Derived80 { return p; }
  fooBBR80(p: Base80, ...n: number[]): Base80 { return p; }
  fooBDR80(p: Base80, ...n: number[]): Derived80 { return new Derived80(); }
  fooDBR80(p: Derived80, ...n: number[]): Base80 { return new Base80(); }
  fooDDR80(p: Derived80, ...n: number[]): Derived80 { return p; }
}
const c80: I80 = new C80();
let foobb80 = c80.fooBB80;
let foobd80 = c80.fooBD80;
let foodb80 = c80.fooDB80;
let foodd80 = c80.fooDD80;
let foobbn80 = c80.fooBBN80;
let foobdn80 = c80.fooBDN80;
let foodbn80 = c80.fooDBN80;
let fooddn80 = c80.fooDDN80;
let foobbo80 = c80.fooBBO80;
let foobdo80 = c80.fooBDO80;
let foodbo80 = c80.fooDBO80;
let fooddo80 = c80.fooDDO80;
let foobbr80 = c80.fooBBR80;
let foobdr80 = c80.fooBDR80;
let foodbr80 = c80.fooDBR80;
let fooddr80 = c80.fooDDR80;
foodb80 = foodd80;


class Base81 {
  b: string = 'b';
}
class Derived81 extends Base81 {
  b: string = 'd';
}
interface I81 {
  fooBB81(p: Base81): Base81;
  fooBD81(p: Base81): Derived81;
  fooDB81(p: Derived81): Base81;
  fooDD81(p: Derived81): Derived81;
  fooBBN81(p: Base81, n: number): Base81;
  fooBDN81(p: Base81, n: number): Derived81;
  fooDBN81(p: Derived81, n: number): Base81;
  fooDDN81(p: Derived81, n: number): Derived81;
  fooBBO81(p: Base81, n?: number): Base81;
  fooBDO81(p: Base81, n?: number): Derived81;
  fooDBO81(p: Derived81, n?: number): Base81;
  fooDDO81(p: Derived81, n?: number): Derived81;
  fooBBR81(p: Base81, ...n: number[]): Base81;
  fooBDR81(p: Base81, ...n: number[]): Derived81;
  fooDBR81(p: Derived81, ...n: number[]): Base81;
  fooDDR81(p: Derived81, ...n: number[]): Derived81;
}
class C81 implements I81 {
  fooBB81(p: Base81): Base81 { return p; }
  fooBD81(p: Base81): Derived81 { return new Derived81(); }
  fooDB81(p: Derived81): Base81 { return new Base81(); }
  fooDD81(p: Derived81): Derived81 { return p; }
  fooBBN81(p: Base81, n: number): Base81 { return p; }
  fooBDN81(p: Base81, n: number): Derived81 { return new Derived81(); }
  fooDBN81(p: Derived81, n: number): Base81 { return new Base81(); }
  fooDDN81(p: Derived81, n: number): Derived81 { return p; }
  fooBBO81(p: Base81, n?: number): Base81 { return p; }
  fooBDO81(p: Base81, n?: number): Derived81 { return new Derived81(); }
  fooDBO81(p: Derived81, n?: number): Base81 { return new Base81(); }
  fooDDO81(p: Derived81, n?: number): Derived81 { return p; }
  fooBBR81(p: Base81, ...n: number[]): Base81 { return p; }
  fooBDR81(p: Base81, ...n: number[]): Derived81 { return new Derived81(); }
  fooDBR81(p: Derived81, ...n: number[]): Base81 { return new Base81(); }
  fooDDR81(p: Derived81, ...n: number[]): Derived81 { return p; }
}
const c81: I81 = new C81();
let foobb81 = c81.fooBB81;
let foobd81 = c81.fooBD81;
let foodb81 = c81.fooDB81;
let foodd81 = c81.fooDD81;
let foobbn81 = c81.fooBBN81;
let foobdn81 = c81.fooBDN81;
let foodbn81 = c81.fooDBN81;
let fooddn81 = c81.fooDDN81;
let foobbo81 = c81.fooBBO81;
let foobdo81 = c81.fooBDO81;
let foodbo81 = c81.fooDBO81;
let fooddo81 = c81.fooDDO81;
let foobbr81 = c81.fooBBR81;
let foobdr81 = c81.fooBDR81;
let foodbr81 = c81.fooDBR81;
let fooddr81 = c81.fooDDR81;
foodd81 = foobd81;


class Base82 {
  b: string = 'b';
}
class Derived82 extends Base82 {
  b: string = 'd';
}
interface I82 {
  fooBB82(p: Base82): Base82;
  fooBD82(p: Base82): Derived82;
  fooDB82(p: Derived82): Base82;
  fooDD82(p: Derived82): Derived82;
  fooBBN82(p: Base82, n: number): Base82;
  fooBDN82(p: Base82, n: number): Derived82;
  fooDBN82(p: Derived82, n: number): Base82;
  fooDDN82(p: Derived82, n: number): Derived82;
  fooBBO82(p: Base82, n?: number): Base82;
  fooBDO82(p: Base82, n?: number): Derived82;
  fooDBO82(p: Derived82, n?: number): Base82;
  fooDDO82(p: Derived82, n?: number): Derived82;
  fooBBR82(p: Base82, ...n: number[]): Base82;
  fooBDR82(p: Base82, ...n: number[]): Derived82;
  fooDBR82(p: Derived82, ...n: number[]): Base82;
  fooDDR82(p: Derived82, ...n: number[]): Derived82;
}
class C82 implements I82 {
  fooBB82(p: Base82): Base82 { return p; }
  fooBD82(p: Base82): Derived82 { return new Derived82(); }
  fooDB82(p: Derived82): Base82 { return new Base82(); }
  fooDD82(p: Derived82): Derived82 { return p; }
  fooBBN82(p: Base82, n: number): Base82 { return p; }
  fooBDN82(p: Base82, n: number): Derived82 { return new Derived82(); }
  fooDBN82(p: Derived82, n: number): Base82 { return new Base82(); }
  fooDDN82(p: Derived82, n: number): Derived82 { return p; }
  fooBBO82(p: Base82, n?: number): Base82 { return p; }
  fooBDO82(p: Base82, n?: number): Derived82 { return new Derived82(); }
  fooDBO82(p: Derived82, n?: number): Base82 { return new Base82(); }
  fooDDO82(p: Derived82, n?: number): Derived82 { return p; }
  fooBBR82(p: Base82, ...n: number[]): Base82 { return p; }
  fooBDR82(p: Base82, ...n: number[]): Derived82 { return new Derived82(); }
  fooDBR82(p: Derived82, ...n: number[]): Base82 { return new Base82(); }
  fooDDR82(p: Derived82, ...n: number[]): Derived82 { return p; }
}
const c82: I82 = new C82();
let foobb82 = c82.fooBB82;
let foobd82 = c82.fooBD82;
let foodb82 = c82.fooDB82;
let foodd82 = c82.fooDD82;
let foobbn82 = c82.fooBBN82;
let foobdn82 = c82.fooBDN82;
let foodbn82 = c82.fooDBN82;
let fooddn82 = c82.fooDDN82;
let foobbo82 = c82.fooBBO82;
let foobdo82 = c82.fooBDO82;
let foodbo82 = c82.fooDBO82;
let fooddo82 = c82.fooDDO82;
let foobbr82 = c82.fooBBR82;
let foobdr82 = c82.fooBDR82;
let foodbr82 = c82.fooDBR82;
let fooddr82 = c82.fooDDR82;
foobbn82 = foobb82;


class Base83 {
  b: string = 'b';
}
class Derived83 extends Base83 {
  b: string = 'd';
}
interface I83 {
  fooBB83(p: Base83): Base83;
  fooBD83(p: Base83): Derived83;
  fooDB83(p: Derived83): Base83;
  fooDD83(p: Derived83): Derived83;
  fooBBN83(p: Base83, n: number): Base83;
  fooBDN83(p: Base83, n: number): Derived83;
  fooDBN83(p: Derived83, n: number): Base83;
  fooDDN83(p: Derived83, n: number): Derived83;
  fooBBO83(p: Base83, n?: number): Base83;
  fooBDO83(p: Base83, n?: number): Derived83;
  fooDBO83(p: Derived83, n?: number): Base83;
  fooDDO83(p: Derived83, n?: number): Derived83;
  fooBBR83(p: Base83, ...n: number[]): Base83;
  fooBDR83(p: Base83, ...n: number[]): Derived83;
  fooDBR83(p: Derived83, ...n: number[]): Base83;
  fooDDR83(p: Derived83, ...n: number[]): Derived83;
}
class C83 implements I83 {
  fooBB83(p: Base83): Base83 { return p; }
  fooBD83(p: Base83): Derived83 { return new Derived83(); }
  fooDB83(p: Derived83): Base83 { return new Base83(); }
  fooDD83(p: Derived83): Derived83 { return p; }
  fooBBN83(p: Base83, n: number): Base83 { return p; }
  fooBDN83(p: Base83, n: number): Derived83 { return new Derived83(); }
  fooDBN83(p: Derived83, n: number): Base83 { return new Base83(); }
  fooDDN83(p: Derived83, n: number): Derived83 { return p; }
  fooBBO83(p: Base83, n?: number): Base83 { return p; }
  fooBDO83(p: Base83, n?: number): Derived83 { return new Derived83(); }
  fooDBO83(p: Derived83, n?: number): Base83 { return new Base83(); }
  fooDDO83(p: Derived83, n?: number): Derived83 { return p; }
  fooBBR83(p: Base83, ...n: number[]): Base83 { return p; }
  fooBDR83(p: Base83, ...n: number[]): Derived83 { return new Derived83(); }
  fooDBR83(p: Derived83, ...n: number[]): Base83 { return new Base83(); }
  fooDDR83(p: Derived83, ...n: number[]): Derived83 { return p; }
}
const c83: I83 = new C83();
let foobb83 = c83.fooBB83;
let foobd83 = c83.fooBD83;
let foodb83 = c83.fooDB83;
let foodd83 = c83.fooDD83;
let foobbn83 = c83.fooBBN83;
let foobdn83 = c83.fooBDN83;
let foodbn83 = c83.fooDBN83;
let fooddn83 = c83.fooDDN83;
let foobbo83 = c83.fooBBO83;
let foobdo83 = c83.fooBDO83;
let foodbo83 = c83.fooDBO83;
let fooddo83 = c83.fooDDO83;
let foobbr83 = c83.fooBBR83;
let foobdr83 = c83.fooBDR83;
let foodbr83 = c83.fooDBR83;
let fooddr83 = c83.fooDDR83;
foobbo83 = foobb83;


class Base84 {
  b: string = 'b';
}
class Derived84 extends Base84 {
  b: string = 'd';
}
interface I84 {
  fooBB84(p: Base84): Base84;
  fooBD84(p: Base84): Derived84;
  fooDB84(p: Derived84): Base84;
  fooDD84(p: Derived84): Derived84;
  fooBBN84(p: Base84, n: number): Base84;
  fooBDN84(p: Base84, n: number): Derived84;
  fooDBN84(p: Derived84, n: number): Base84;
  fooDDN84(p: Derived84, n: number): Derived84;
  fooBBO84(p: Base84, n?: number): Base84;
  fooBDO84(p: Base84, n?: number): Derived84;
  fooDBO84(p: Derived84, n?: number): Base84;
  fooDDO84(p: Derived84, n?: number): Derived84;
  fooBBR84(p: Base84, ...n: number[]): Base84;
  fooBDR84(p: Base84, ...n: number[]): Derived84;
  fooDBR84(p: Derived84, ...n: number[]): Base84;
  fooDDR84(p: Derived84, ...n: number[]): Derived84;
}
class C84 implements I84 {
  fooBB84(p: Base84): Base84 { return p; }
  fooBD84(p: Base84): Derived84 { return new Derived84(); }
  fooDB84(p: Derived84): Base84 { return new Base84(); }
  fooDD84(p: Derived84): Derived84 { return p; }
  fooBBN84(p: Base84, n: number): Base84 { return p; }
  fooBDN84(p: Base84, n: number): Derived84 { return new Derived84(); }
  fooDBN84(p: Derived84, n: number): Base84 { return new Base84(); }
  fooDDN84(p: Derived84, n: number): Derived84 { return p; }
  fooBBO84(p: Base84, n?: number): Base84 { return p; }
  fooBDO84(p: Base84, n?: number): Derived84 { return new Derived84(); }
  fooDBO84(p: Derived84, n?: number): Base84 { return new Base84(); }
  fooDDO84(p: Derived84, n?: number): Derived84 { return p; }
  fooBBR84(p: Base84, ...n: number[]): Base84 { return p; }
  fooBDR84(p: Base84, ...n: number[]): Derived84 { return new Derived84(); }
  fooDBR84(p: Derived84, ...n: number[]): Base84 { return new Base84(); }
  fooDDR84(p: Derived84, ...n: number[]): Derived84 { return p; }
}
const c84: I84 = new C84();
let foobb84 = c84.fooBB84;
let foobd84 = c84.fooBD84;
let foodb84 = c84.fooDB84;
let foodd84 = c84.fooDD84;
let foobbn84 = c84.fooBBN84;
let foobdn84 = c84.fooBDN84;
let foodbn84 = c84.fooDBN84;
let fooddn84 = c84.fooDDN84;
let foobbo84 = c84.fooBBO84;
let foobdo84 = c84.fooBDO84;
let foodbo84 = c84.fooDBO84;
let fooddo84 = c84.fooDDO84;
let foobbr84 = c84.fooBBR84;
let foobdr84 = c84.fooBDR84;
let foodbr84 = c84.fooDBR84;
let fooddr84 = c84.fooDDR84;
foobbn84 = foobd84;


class Base85 {
  b: string = 'b';
}
class Derived85 extends Base85 {
  b: string = 'd';
}
interface I85 {
  fooBB85(p: Base85): Base85;
  fooBD85(p: Base85): Derived85;
  fooDB85(p: Derived85): Base85;
  fooDD85(p: Derived85): Derived85;
  fooBBN85(p: Base85, n: number): Base85;
  fooBDN85(p: Base85, n: number): Derived85;
  fooDBN85(p: Derived85, n: number): Base85;
  fooDDN85(p: Derived85, n: number): Derived85;
  fooBBO85(p: Base85, n?: number): Base85;
  fooBDO85(p: Base85, n?: number): Derived85;
  fooDBO85(p: Derived85, n?: number): Base85;
  fooDDO85(p: Derived85, n?: number): Derived85;
  fooBBR85(p: Base85, ...n: number[]): Base85;
  fooBDR85(p: Base85, ...n: number[]): Derived85;
  fooDBR85(p: Derived85, ...n: number[]): Base85;
  fooDDR85(p: Derived85, ...n: number[]): Derived85;
}
class C85 implements I85 {
  fooBB85(p: Base85): Base85 { return p; }
  fooBD85(p: Base85): Derived85 { return new Derived85(); }
  fooDB85(p: Derived85): Base85 { return new Base85(); }
  fooDD85(p: Derived85): Derived85 { return p; }
  fooBBN85(p: Base85, n: number): Base85 { return p; }
  fooBDN85(p: Base85, n: number): Derived85 { return new Derived85(); }
  fooDBN85(p: Derived85, n: number): Base85 { return new Base85(); }
  fooDDN85(p: Derived85, n: number): Derived85 { return p; }
  fooBBO85(p: Base85, n?: number): Base85 { return p; }
  fooBDO85(p: Base85, n?: number): Derived85 { return new Derived85(); }
  fooDBO85(p: Derived85, n?: number): Base85 { return new Base85(); }
  fooDDO85(p: Derived85, n?: number): Derived85 { return p; }
  fooBBR85(p: Base85, ...n: number[]): Base85 { return p; }
  fooBDR85(p: Base85, ...n: number[]): Derived85 { return new Derived85(); }
  fooDBR85(p: Derived85, ...n: number[]): Base85 { return new Base85(); }
  fooDDR85(p: Derived85, ...n: number[]): Derived85 { return p; }
}
const c85: I85 = new C85();
let foobb85 = c85.fooBB85;
let foobd85 = c85.fooBD85;
let foodb85 = c85.fooDB85;
let foodd85 = c85.fooDD85;
let foobbn85 = c85.fooBBN85;
let foobdn85 = c85.fooBDN85;
let foodbn85 = c85.fooDBN85;
let fooddn85 = c85.fooDDN85;
let foobbo85 = c85.fooBBO85;
let foobdo85 = c85.fooBDO85;
let foodbo85 = c85.fooDBO85;
let fooddo85 = c85.fooDDO85;
let foobbr85 = c85.fooBBR85;
let foobdr85 = c85.fooBDR85;
let foodbr85 = c85.fooDBR85;
let fooddr85 = c85.fooDDR85;
foobbo85 = foobd85;


class Base86 {
  b: string = 'b';
}
class Derived86 extends Base86 {
  b: string = 'd';
}
interface I86 {
  fooBB86(p: Base86): Base86;
  fooBD86(p: Base86): Derived86;
  fooDB86(p: Derived86): Base86;
  fooDD86(p: Derived86): Derived86;
  fooBBN86(p: Base86, n: number): Base86;
  fooBDN86(p: Base86, n: number): Derived86;
  fooDBN86(p: Derived86, n: number): Base86;
  fooDDN86(p: Derived86, n: number): Derived86;
  fooBBO86(p: Base86, n?: number): Base86;
  fooBDO86(p: Base86, n?: number): Derived86;
  fooDBO86(p: Derived86, n?: number): Base86;
  fooDDO86(p: Derived86, n?: number): Derived86;
  fooBBR86(p: Base86, ...n: number[]): Base86;
  fooBDR86(p: Base86, ...n: number[]): Derived86;
  fooDBR86(p: Derived86, ...n: number[]): Base86;
  fooDDR86(p: Derived86, ...n: number[]): Derived86;
}
class C86 implements I86 {
  fooBB86(p: Base86): Base86 { return p; }
  fooBD86(p: Base86): Derived86 { return new Derived86(); }
  fooDB86(p: Derived86): Base86 { return new Base86(); }
  fooDD86(p: Derived86): Derived86 { return p; }
  fooBBN86(p: Base86, n: number): Base86 { return p; }
  fooBDN86(p: Base86, n: number): Derived86 { return new Derived86(); }
  fooDBN86(p: Derived86, n: number): Base86 { return new Base86(); }
  fooDDN86(p: Derived86, n: number): Derived86 { return p; }
  fooBBO86(p: Base86, n?: number): Base86 { return p; }
  fooBDO86(p: Base86, n?: number): Derived86 { return new Derived86(); }
  fooDBO86(p: Derived86, n?: number): Base86 { return new Base86(); }
  fooDDO86(p: Derived86, n?: number): Derived86 { return p; }
  fooBBR86(p: Base86, ...n: number[]): Base86 { return p; }
  fooBDR86(p: Base86, ...n: number[]): Derived86 { return new Derived86(); }
  fooDBR86(p: Derived86, ...n: number[]): Base86 { return new Base86(); }
  fooDDR86(p: Derived86, ...n: number[]): Derived86 { return p; }
}
const c86: I86 = new C86();
let foobb86 = c86.fooBB86;
let foobd86 = c86.fooBD86;
let foodb86 = c86.fooDB86;
let foodd86 = c86.fooDD86;
let foobbn86 = c86.fooBBN86;
let foobdn86 = c86.fooBDN86;
let foodbn86 = c86.fooDBN86;
let fooddn86 = c86.fooDDN86;
let foobbo86 = c86.fooBBO86;
let foobdo86 = c86.fooBDO86;
let foodbo86 = c86.fooDBO86;
let fooddo86 = c86.fooDDO86;
let foobbr86 = c86.fooBBR86;
let foobdr86 = c86.fooBDR86;
let foodbr86 = c86.fooDBR86;
let fooddr86 = c86.fooDDR86;
foodbn86 = foobd86;


class Base87 {
  b: string = 'b';
}
class Derived87 extends Base87 {
  b: string = 'd';
}
interface I87 {
  fooBB87(p: Base87): Base87;
  fooBD87(p: Base87): Derived87;
  fooDB87(p: Derived87): Base87;
  fooDD87(p: Derived87): Derived87;
  fooBBN87(p: Base87, n: number): Base87;
  fooBDN87(p: Base87, n: number): Derived87;
  fooDBN87(p: Derived87, n: number): Base87;
  fooDDN87(p: Derived87, n: number): Derived87;
  fooBBO87(p: Base87, n?: number): Base87;
  fooBDO87(p: Base87, n?: number): Derived87;
  fooDBO87(p: Derived87, n?: number): Base87;
  fooDDO87(p: Derived87, n?: number): Derived87;
  fooBBR87(p: Base87, ...n: number[]): Base87;
  fooBDR87(p: Base87, ...n: number[]): Derived87;
  fooDBR87(p: Derived87, ...n: number[]): Base87;
  fooDDR87(p: Derived87, ...n: number[]): Derived87;
}
class C87 implements I87 {
  fooBB87(p: Base87): Base87 { return p; }
  fooBD87(p: Base87): Derived87 { return new Derived87(); }
  fooDB87(p: Derived87): Base87 { return new Base87(); }
  fooDD87(p: Derived87): Derived87 { return p; }
  fooBBN87(p: Base87, n: number): Base87 { return p; }
  fooBDN87(p: Base87, n: number): Derived87 { return new Derived87(); }
  fooDBN87(p: Derived87, n: number): Base87 { return new Base87(); }
  fooDDN87(p: Derived87, n: number): Derived87 { return p; }
  fooBBO87(p: Base87, n?: number): Base87 { return p; }
  fooBDO87(p: Base87, n?: number): Derived87 { return new Derived87(); }
  fooDBO87(p: Derived87, n?: number): Base87 { return new Base87(); }
  fooDDO87(p: Derived87, n?: number): Derived87 { return p; }
  fooBBR87(p: Base87, ...n: number[]): Base87 { return p; }
  fooBDR87(p: Base87, ...n: number[]): Derived87 { return new Derived87(); }
  fooDBR87(p: Derived87, ...n: number[]): Base87 { return new Base87(); }
  fooDDR87(p: Derived87, ...n: number[]): Derived87 { return p; }
}
const c87: I87 = new C87();
let foobb87 = c87.fooBB87;
let foobd87 = c87.fooBD87;
let foodb87 = c87.fooDB87;
let foodd87 = c87.fooDD87;
let foobbn87 = c87.fooBBN87;
let foobdn87 = c87.fooBDN87;
let foodbn87 = c87.fooDBN87;
let fooddn87 = c87.fooDDN87;
let foobbo87 = c87.fooBBO87;
let foobdo87 = c87.fooBDO87;
let foodbo87 = c87.fooDBO87;
let fooddo87 = c87.fooDDO87;
let foobbr87 = c87.fooBBR87;
let foobdr87 = c87.fooBDR87;
let foodbr87 = c87.fooDBR87;
let fooddr87 = c87.fooDDR87;
foodbo87 = foobd87;


class Base88 {
  b: string = 'b';
}
class Derived88 extends Base88 {
  b: string = 'd';
}
interface I88 {
  fooBB88(p: Base88): Base88;
  fooBD88(p: Base88): Derived88;
  fooDB88(p: Derived88): Base88;
  fooDD88(p: Derived88): Derived88;
  fooBBN88(p: Base88, n: number): Base88;
  fooBDN88(p: Base88, n: number): Derived88;
  fooDBN88(p: Derived88, n: number): Base88;
  fooDDN88(p: Derived88, n: number): Derived88;
  fooBBO88(p: Base88, n?: number): Base88;
  fooBDO88(p: Base88, n?: number): Derived88;
  fooDBO88(p: Derived88, n?: number): Base88;
  fooDDO88(p: Derived88, n?: number): Derived88;
  fooBBR88(p: Base88, ...n: number[]): Base88;
  fooBDR88(p: Base88, ...n: number[]): Derived88;
  fooDBR88(p: Derived88, ...n: number[]): Base88;
  fooDDR88(p: Derived88, ...n: number[]): Derived88;
}
class C88 implements I88 {
  fooBB88(p: Base88): Base88 { return p; }
  fooBD88(p: Base88): Derived88 { return new Derived88(); }
  fooDB88(p: Derived88): Base88 { return new Base88(); }
  fooDD88(p: Derived88): Derived88 { return p; }
  fooBBN88(p: Base88, n: number): Base88 { return p; }
  fooBDN88(p: Base88, n: number): Derived88 { return new Derived88(); }
  fooDBN88(p: Derived88, n: number): Base88 { return new Base88(); }
  fooDDN88(p: Derived88, n: number): Derived88 { return p; }
  fooBBO88(p: Base88, n?: number): Base88 { return p; }
  fooBDO88(p: Base88, n?: number): Derived88 { return new Derived88(); }
  fooDBO88(p: Derived88, n?: number): Base88 { return new Base88(); }
  fooDDO88(p: Derived88, n?: number): Derived88 { return p; }
  fooBBR88(p: Base88, ...n: number[]): Base88 { return p; }
  fooBDR88(p: Base88, ...n: number[]): Derived88 { return new Derived88(); }
  fooDBR88(p: Derived88, ...n: number[]): Base88 { return new Base88(); }
  fooDDR88(p: Derived88, ...n: number[]): Derived88 { return p; }
}
const c88: I88 = new C88();
let foobb88 = c88.fooBB88;
let foobd88 = c88.fooBD88;
let foodb88 = c88.fooDB88;
let foodd88 = c88.fooDD88;
let foobbn88 = c88.fooBBN88;
let foobdn88 = c88.fooBDN88;
let foodbn88 = c88.fooDBN88;
let fooddn88 = c88.fooDDN88;
let foobbo88 = c88.fooBBO88;
let foobdo88 = c88.fooBDO88;
let foodbo88 = c88.fooDBO88;
let fooddo88 = c88.fooDDO88;
let foobbr88 = c88.fooBBR88;
let foobdr88 = c88.fooBDR88;
let foodbr88 = c88.fooDBR88;
let fooddr88 = c88.fooDDR88;
foodbn88 = fooddn88;


class Base89 {
  b: string = 'b';
}
class Derived89 extends Base89 {
  b: string = 'd';
}
interface I89 {
  fooBB89(p: Base89): Base89;
  fooBD89(p: Base89): Derived89;
  fooDB89(p: Derived89): Base89;
  fooDD89(p: Derived89): Derived89;
  fooBBN89(p: Base89, n: number): Base89;
  fooBDN89(p: Base89, n: number): Derived89;
  fooDBN89(p: Derived89, n: number): Base89;
  fooDDN89(p: Derived89, n: number): Derived89;
  fooBBO89(p: Base89, n?: number): Base89;
  fooBDO89(p: Base89, n?: number): Derived89;
  fooDBO89(p: Derived89, n?: number): Base89;
  fooDDO89(p: Derived89, n?: number): Derived89;
  fooBBR89(p: Base89, ...n: number[]): Base89;
  fooBDR89(p: Base89, ...n: number[]): Derived89;
  fooDBR89(p: Derived89, ...n: number[]): Base89;
  fooDDR89(p: Derived89, ...n: number[]): Derived89;
}
class C89 implements I89 {
  fooBB89(p: Base89): Base89 { return p; }
  fooBD89(p: Base89): Derived89 { return new Derived89(); }
  fooDB89(p: Derived89): Base89 { return new Base89(); }
  fooDD89(p: Derived89): Derived89 { return p; }
  fooBBN89(p: Base89, n: number): Base89 { return p; }
  fooBDN89(p: Base89, n: number): Derived89 { return new Derived89(); }
  fooDBN89(p: Derived89, n: number): Base89 { return new Base89(); }
  fooDDN89(p: Derived89, n: number): Derived89 { return p; }
  fooBBO89(p: Base89, n?: number): Base89 { return p; }
  fooBDO89(p: Base89, n?: number): Derived89 { return new Derived89(); }
  fooDBO89(p: Derived89, n?: number): Base89 { return new Base89(); }
  fooDDO89(p: Derived89, n?: number): Derived89 { return p; }
  fooBBR89(p: Base89, ...n: number[]): Base89 { return p; }
  fooBDR89(p: Base89, ...n: number[]): Derived89 { return new Derived89(); }
  fooDBR89(p: Derived89, ...n: number[]): Base89 { return new Base89(); }
  fooDDR89(p: Derived89, ...n: number[]): Derived89 { return p; }
}
const c89: I89 = new C89();
let foobb89 = c89.fooBB89;
let foobd89 = c89.fooBD89;
let foodb89 = c89.fooDB89;
let foodd89 = c89.fooDD89;
let foobbn89 = c89.fooBBN89;
let foobdn89 = c89.fooBDN89;
let foodbn89 = c89.fooDBN89;
let fooddn89 = c89.fooDDN89;
let foobbo89 = c89.fooBBO89;
let foobdo89 = c89.fooBDO89;
let foodbo89 = c89.fooDBO89;
let fooddo89 = c89.fooDDO89;
let foobbr89 = c89.fooBBR89;
let foobdr89 = c89.fooBDR89;
let foodbr89 = c89.fooDBR89;
let fooddr89 = c89.fooDDR89;
foodbo89 = fooddo89;


class Base90 {
  b: string = 'b';
}
class Derived90 extends Base90 {
  b: string = 'd';
}
interface I90 {
  fooBB90(p: Base90): Base90;
  fooBD90(p: Base90): Derived90;
  fooDB90(p: Derived90): Base90;
  fooDD90(p: Derived90): Derived90;
  fooBBN90(p: Base90, n: number): Base90;
  fooBDN90(p: Base90, n: number): Derived90;
  fooDBN90(p: Derived90, n: number): Base90;
  fooDDN90(p: Derived90, n: number): Derived90;
  fooBBO90(p: Base90, n?: number): Base90;
  fooBDO90(p: Base90, n?: number): Derived90;
  fooDBO90(p: Derived90, n?: number): Base90;
  fooDDO90(p: Derived90, n?: number): Derived90;
  fooBBR90(p: Base90, ...n: number[]): Base90;
  fooBDR90(p: Base90, ...n: number[]): Derived90;
  fooDBR90(p: Derived90, ...n: number[]): Base90;
  fooDDR90(p: Derived90, ...n: number[]): Derived90;
}
class C90 implements I90 {
  fooBB90(p: Base90): Base90 { return p; }
  fooBD90(p: Base90): Derived90 { return new Derived90(); }
  fooDB90(p: Derived90): Base90 { return new Base90(); }
  fooDD90(p: Derived90): Derived90 { return p; }
  fooBBN90(p: Base90, n: number): Base90 { return p; }
  fooBDN90(p: Base90, n: number): Derived90 { return new Derived90(); }
  fooDBN90(p: Derived90, n: number): Base90 { return new Base90(); }
  fooDDN90(p: Derived90, n: number): Derived90 { return p; }
  fooBBO90(p: Base90, n?: number): Base90 { return p; }
  fooBDO90(p: Base90, n?: number): Derived90 { return new Derived90(); }
  fooDBO90(p: Derived90, n?: number): Base90 { return new Base90(); }
  fooDDO90(p: Derived90, n?: number): Derived90 { return p; }
  fooBBR90(p: Base90, ...n: number[]): Base90 { return p; }
  fooBDR90(p: Base90, ...n: number[]): Derived90 { return new Derived90(); }
  fooDBR90(p: Derived90, ...n: number[]): Base90 { return new Base90(); }
  fooDDR90(p: Derived90, ...n: number[]): Derived90 { return p; }
}
const c90: I90 = new C90();
let foobb90 = c90.fooBB90;
let foobd90 = c90.fooBD90;
let foodb90 = c90.fooDB90;
let foodd90 = c90.fooDD90;
let foobbn90 = c90.fooBBN90;
let foobdn90 = c90.fooBDN90;
let foodbn90 = c90.fooDBN90;
let fooddn90 = c90.fooDDN90;
let foobbo90 = c90.fooBBO90;
let foobdo90 = c90.fooBDO90;
let foodbo90 = c90.fooDBO90;
let fooddo90 = c90.fooDDO90;
let foobbr90 = c90.fooBBR90;
let foobdr90 = c90.fooBDR90;
let foodbr90 = c90.fooDBR90;
let fooddr90 = c90.fooDDR90;
foodbr90 = fooddr90;


class Base91 {
  b: string = 'b';
}
class Derived91 extends Base91 {
  b: string = 'd';
}
interface I91 {
  fooBB91(p: Base91): Base91;
  fooBD91(p: Base91): Derived91;
  fooDB91(p: Derived91): Base91;
  fooDD91(p: Derived91): Derived91;
  fooBBN91(p: Base91, n: number): Base91;
  fooBDN91(p: Base91, n: number): Derived91;
  fooDBN91(p: Derived91, n: number): Base91;
  fooDDN91(p: Derived91, n: number): Derived91;
  fooBBO91(p: Base91, n?: number): Base91;
  fooBDO91(p: Base91, n?: number): Derived91;
  fooDBO91(p: Derived91, n?: number): Base91;
  fooDDO91(p: Derived91, n?: number): Derived91;
  fooBBR91(p: Base91, ...n: number[]): Base91;
  fooBDR91(p: Base91, ...n: number[]): Derived91;
  fooDBR91(p: Derived91, ...n: number[]): Base91;
  fooDDR91(p: Derived91, ...n: number[]): Derived91;
}
class C91 implements I91 {
  fooBB91(p: Base91): Base91 { return p; }
  fooBD91(p: Base91): Derived91 { return new Derived91(); }
  fooDB91(p: Derived91): Base91 { return new Base91(); }
  fooDD91(p: Derived91): Derived91 { return p; }
  fooBBN91(p: Base91, n: number): Base91 { return p; }
  fooBDN91(p: Base91, n: number): Derived91 { return new Derived91(); }
  fooDBN91(p: Derived91, n: number): Base91 { return new Base91(); }
  fooDDN91(p: Derived91, n: number): Derived91 { return p; }
  fooBBO91(p: Base91, n?: number): Base91 { return p; }
  fooBDO91(p: Base91, n?: number): Derived91 { return new Derived91(); }
  fooDBO91(p: Derived91, n?: number): Base91 { return new Base91(); }
  fooDDO91(p: Derived91, n?: number): Derived91 { return p; }
  fooBBR91(p: Base91, ...n: number[]): Base91 { return p; }
  fooBDR91(p: Base91, ...n: number[]): Derived91 { return new Derived91(); }
  fooDBR91(p: Derived91, ...n: number[]): Base91 { return new Base91(); }
  fooDDR91(p: Derived91, ...n: number[]): Derived91 { return p; }
}
const c91: I91 = new C91();
let foobb91 = c91.fooBB91;
let foobd91 = c91.fooBD91;
let foodb91 = c91.fooDB91;
let foodd91 = c91.fooDD91;
let foobbn91 = c91.fooBBN91;
let foobdn91 = c91.fooBDN91;
let foodbn91 = c91.fooDBN91;
let fooddn91 = c91.fooDDN91;
let foobbo91 = c91.fooBBO91;
let foobdo91 = c91.fooBDO91;
let foodbo91 = c91.fooDBO91;
let fooddo91 = c91.fooDDO91;
let foobbr91 = c91.fooBBR91;
let foobdr91 = c91.fooBDR91;
let foodbr91 = c91.fooDBR91;
let fooddr91 = c91.fooDDR91;
foodbn91 = foobdn91;

export default function SubtypingForFunctionTypesTest03(): void {
  describe('SubtypingForFunctionTypesTest03', () => {
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
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_7000
     * @tc.name      testPositiveInstanceMethodGeneric0070
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
    it("testPositiveInstanceMethodGeneric0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0070';

      expect(foodbo70(new Derived70) instanceof Derived70).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_7100
     * @tc.name      testPositiveInstanceMethodGeneric0071
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
    it("testPositiveInstanceMethodGeneric0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0071';

      expect(foodbr71(new Derived71, 1, 2, 3) instanceof Derived71).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_7200
     * @tc.name      testPositiveInstanceMethodGeneric0072
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
    it("testPositiveInstanceMethodGeneric0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0072';

      expect(foodbn72(new Derived72, 1) instanceof Base72).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_7300
     * @tc.name      testPositiveInstanceMethodGeneric0073
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
    it("testPositiveInstanceMethodGeneric0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0073';

      expect(foodbo73(new Derived73) instanceof Base73).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_7400
     * @tc.name      testPositiveInstanceMethodGeneric0074
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
    it("testPositiveInstanceMethodGeneric0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0074';

      expect(foodbr74(new Derived74, 1, 2, 3) instanceof Base74).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_7500
     * @tc.name      testPositiveInstanceMethodGeneric0075
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
    it("testPositiveInstanceMethodGeneric0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0075';

      let r = foodbn75.unsafeCall(new Base75, 1.0)
      expect(r instanceof Base75).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_7600
     * @tc.name      testPositiveInstanceMethodGeneric0076
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
    it("testPositiveInstanceMethodGeneric0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0076';

      let r = foodbo76.unsafeCall(new Base76)
      expect(r instanceof Base76).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_7700
     * @tc.name      testPositiveInstanceMethodGeneric0077
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
    it("testPositiveInstanceMethodGeneric0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInstanceMethodGeneric0077';

      let r = foodbr77.unsafeCall(new Base77, 1.0, 2.0, 3.0)
      expect(r instanceof Base77).assertTrue()
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_7800
     * @tc.name      testPositiveInterfaceMethod0078
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
    it("testPositiveInterfaceMethod0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0078';

      expect(foobb78(new Base78) instanceof Derived78).assertTrue()
      expect(foobb78(new Base78).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_7900
     * @tc.name      testPositiveInterfaceMethod0079
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
    it("testPositiveInterfaceMethod0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0079';

      let r = foodb79.unsafeCall(new Base79)
      expect(r instanceof Derived79).assertTrue()
      expect((r as Base79).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_8000
     * @tc.name      testPositiveInterfaceMethod0080
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
    it("testPositiveInterfaceMethod0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0080';

      expect(foodb80(new Derived80) instanceof Derived80).assertTrue()
      expect(foodb80(new Derived80).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_8100
     * @tc.name      testPositiveInterfaceMethod0081
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
    it("testPositiveInterfaceMethod0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0081';

      let r = foodd81.unsafeCall(new Base81)
      expect(r instanceof Derived81).assertTrue()
      expect((r as Base81).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_8200
     * @tc.name      testPositiveInterfaceMethod0082
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
    it("testPositiveInterfaceMethod0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0082';

      expect(foobbn82(new Base82, 1) instanceof Base82).assertTrue()
      expect(foobbn82(new Base82, 1).b).assertEqual('b')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_8300
     * @tc.name      testPositiveInterfaceMethod0083
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
    it("testPositiveInterfaceMethod0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0083';

      expect(foobbo83(new Base83) instanceof Base83).assertTrue()
      expect(foobbo83(new Base83).b).assertEqual('b')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_8400
     * @tc.name      testPositiveInterfaceMethod0084
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
    it("testPositiveInterfaceMethod0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0084';

      expect(foobbn84(new Base84, 1) instanceof Derived84).assertTrue()
      expect(foobbn84(new Base84, 1).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_8500
     * @tc.name      testPositiveInterfaceMethod0085
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
    it("testPositiveInterfaceMethod0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0085';

      expect(foobbo85(new Base85) instanceof Derived85).assertTrue()
      expect(foobbo85(new Base85).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_8600
     * @tc.name      testPositiveInterfaceMethod0086
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
    it("testPositiveInterfaceMethod0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0086';

      expect(foodbn86(new Derived86, 1) instanceof Derived86).assertTrue()
      expect(foodbn86(new Derived86, 1).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_8700
     * @tc.name      testPositiveInterfaceMethod0087
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
    it("testPositiveInterfaceMethod0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0087';

      expect(foodbo87(new Derived87) instanceof Derived87).assertTrue()
      expect(foodbo87(new Derived87).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_8800
     * @tc.name      testPositiveInterfaceMethod0088
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
    it("testPositiveInterfaceMethod0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0088';

      expect(foodbn88(new Derived88, 1) instanceof Derived88).assertTrue()
      expect(foodbn88(new Derived88, 1).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_8900
     * @tc.name      testPositiveInterfaceMethod0089
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
    it("testPositiveInterfaceMethod0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0089';

      expect(foodbo89(new Derived89) instanceof Derived89).assertTrue()
      expect(foodbo89(new Derived89).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_9000
     * @tc.name      testPositiveInterfaceMethod0090
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
    it("testPositiveInterfaceMethod0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0090';

      expect(foodbr90(new Derived90, 1, 2, 3) instanceof Derived90).assertTrue()
      expect(foodbr90(new Derived90, 1, 2, 3).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_9100
     * @tc.name      testPositiveInterfaceMethod0091
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
    it("testPositiveInterfaceMethod0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveInterfaceMethod0091';

      expect(foodbn91(new Derived91, 1) instanceof Derived91).assertTrue()
      expect(foodbn91(new Derived91, 1).b).assertEqual('d')
    })

  })
}