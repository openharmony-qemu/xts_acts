export function* foo() {}

function* foo1() {}
export const generator = foo1();

export function func() {
  console.info("hello world");
}