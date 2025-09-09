export function createProxy(target) {
  try {
    return new Proxy(target, {
      get(target, prop) {
        console.log(`读取属性: ${String(prop)}`);
        return Reflect.get(target, prop);
      },
      set(target, prop, value) {
        console.log(`设置属性: ${String(prop)} = ${value}`);
        return Reflect.set(target, prop, value);
      }
    });
  } catch (error) {
    return error.name;
  }

}