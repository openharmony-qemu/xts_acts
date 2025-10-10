export function testArraySpliceJs0082() {
    const obj={0:1,1:2,2:3,length:3};
    const removed=Array.prototype.splice.call(obj,1,1,99);
    return [obj[0], obj[1], obj[2], obj.length];
}

export function testArraySpliceJs0087() {
    const obj={0:1,1:2,2:3,length:3};
    Array.prototype.splice.call(obj,1,1,99);
    const mapped=(Array.prototype.map.call(obj,(v)=>v*2));
    return mapped;
}

export function testArraySpliceJs0103() {
    const obj={0:1,1:2,2:3,length:3};
    const removed=Array.prototype.splice.call(obj,-2,1,99);
    return [obj[0], obj[1], obj[2], obj.length];
}

export function testArraySpliceJs0109() {
    const obj={0:1,1:2,length:2};
    Array.prototype.splice.call(obj,1,0,99,100);
    return [obj[0], obj[1], obj[2], obj[3], obj.length];
}