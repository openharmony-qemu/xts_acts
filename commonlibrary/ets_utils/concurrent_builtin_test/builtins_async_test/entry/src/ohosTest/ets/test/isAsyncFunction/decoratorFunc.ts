
export function customDecorator(target: Object, propertyKey: string, descriptor: PropertyDescriptor): PropertyDescriptor {
  const originalMethod = descriptor.value;
  descriptor.value = async function (...args: unknown[]): Promise<unknown> {
    return originalMethod.apply(this, args);
  };
  return descriptor;
}

export function paramDecorator(logMessage: string) {
  return function (target: Object, propertyKey: string, descriptor: PropertyDescriptor): PropertyDescriptor {
    const originalMethod = descriptor.value;
    descriptor.value = async function (...args: unknown[]): Promise<unknown> {
      return originalMethod.apply(this, args);
    };
    return descriptor;
  };
}

export function decorator1(target: Object, propertyKey: string, descriptor: PropertyDescriptor): PropertyDescriptor {
  return descriptor;
}

export function decorator2(target: Object, propertyKey: string, descriptor: PropertyDescriptor): PropertyDescriptor {
  return descriptor;
}

export function accessorDecorator(target: Object, propertyKey: string, descriptor: PropertyDescriptor): PropertyDescriptor {
  return descriptor;
}

export function logDecorator(target: Object, propertyKey: string, descriptor: PropertyDescriptor): PropertyDescriptor {
  return descriptor;
}

export function parameterDecorator(target: Object, propertyKey: string, parameterIndex: number): void {
}

export function classDecorator<T extends { new (...args: unknown[]): {} }>(constructor: T): void {
}

export class DecoratedAsyncClass {
  @customDecorator
  async decoratedAsyncMethod(): Promise<number> {
    return 42;
  }

  @customDecorator
  syncMethodDecorated(): number {
    return 10;
  }

  @decorator1
  async methodWithDecorator1(): Promise<string> {
    return 'decorator1';
  }

  @decorator2
  async methodWithDecorator2(): Promise<boolean> {
    return true;
  }

  @accessorDecorator
  get decoratedGetter(): number {
    return 100;
  }

  async methodAfterAccessor(): Promise<void> {}
}

export class MultiDecoratorClass {
  @decorator1
  @decorator2
  async multiDecoratedMethod(): Promise<number> {
    return 99;
  }
}

export class ParamDecoratedClass {
  @paramDecorator('log message')
  async paramDecoratedMethod(): Promise<string> {
    return 'param';
  }
}