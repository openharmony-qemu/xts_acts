export class Animal001 {
  public name: string

  constructor() {
    this.name = 'unknown'
  }
}

export class Dog001 extends Animal001 {
  constructor() {
    super()
  }
}

export class Animal002 {
  constructor(public name: string, public age: number) {
  }
}

export class Dog002 extends Animal002 {
  constructor(name: string, age: number, public breed: string) {
    super(name, age)
  }
}

export class Base003 {
  constructor(public id: number, public label?: string) {
  }
}

export class Child003 extends Base003 {
  constructor(id: number, label?: string) {
    super(id, label)
  }
}

export class Base005 {
  constructor(public config: { host: string; port: number }) {
  }
}

export class Child005 extends Base005 {
  constructor(config: { host: string; port: number }) {
    super(config)
  }
}

export class A006 {
  constructor(public a: number) {
  }
}

export class B006 extends A006 {
  constructor(a: number, public b: number) {
    super(a)
  }
}

export class C006 extends B006 {
  constructor(a: number, b: number, public c: number) {
    super(a, b)
  }
}

export class Container007<T> {
  constructor(public value: T) {
  }
}

export class NumberBox007 extends Container007<number> {
  constructor(value: number) {
    super(value)
  }
}

export class Animal008 {
  speak(): string {
    return 'generic sound'
  }
}

export class Dog008 extends Animal008 {
  bark(): string {
    return super.speak() + ' - Woof'
  }
}

export class Animal009 {
  speak(): string {
    return 'generic'
  }
}

export class Dog009 extends Animal009 {
  speak(): string {
    return super.speak() + ' Woof'
  }
}

export class Calculator010 {
  compute(a: number, b: number): number {
    return a + b
  }
}

export class AdvCalculator010 extends Calculator010 {
  compute(a: number, b: number): number {
    return super.compute(a, b) * 2
  }
}

export class Base011 {
  private _val: number = 0

  get value(): number {
    return this._val
  }

  set value(v: number) {
    this._val = v
  }
}

export class Child011 extends Base011 {
  set value(v: number) {
    super.value = v + 100
  }

  get value(): number {
    return super.value
  }
}

export class A012 {
  greet(): string {
    return 'A012'
  }
}

export class B012 extends A012 {
  greet(): string {
    return super.greet() + 'B012'
  }
}

export class C012 extends B012 {
  greet(): string {
    return super.greet() + 'C012'
  }
}

export class Base014 {
  static version(): string {
    return '1.0'
  }
}

export class Child014 extends Base014 {
  static version(): string {
    return super.version() + '-child'
  }
}

export class Base015 {
  static count: number = 10
}

export class Child015 extends Base015 {
  static getCount(): number {
    return super.count
  }
}

export class Base017 {
  show(): string {
    return 'base'
  }
}

export class Child017 extends Base017 {
  show(): string {
    return super.show()
  }
}

export class Base018 {
  greet(): string {
    return 'hello'
  }
}

export class Child018 extends Base018 {
  greet(): string {
    return 'hi'
  }

  testArrow(): string {
    const fn = () => super.greet()
    return fn()
  }
}

export class Base019 {
  async fetchData(): Promise<string> {
    return 'data'
  }
}

export class Child019 extends Base019 {
  async fetchData(): Promise<string> {
    let parent = await super.fetchData()
    return parent + '-extended'
  }
}

export class Base020 {
  constructor(public base: number = 0) {
  }
}

export class Child020 extends Base020 {
  constructor() {
    super(10)
  }

  checkThis(): boolean {
    return this instanceof Child020 && this.base === 10
  }
}

export class Base021 {
  getValue(): number {
    return 42
  }
}

export class Child021 extends Base021 {
  getValue(): number {
    return super.getValue() + 1
  }
}

export class Base024 {
  getOrNull(): string | null {
    return null
  }
}

export class Child024 extends Base024 {
  getOrNull(): string | null {
    return super.getOrNull()
  }
}

export class Base025 {
  getUndef(): string | undefined {
    return undefined
  }
}

export class Child025 extends Base025 {
  getUndef(): string | undefined {
    return super.getUndef()
  }
}

export class Base026 {
  getItems(): string[] {
    return []
  }
}

export class Child026 extends Base026 {
  getItems(): string[] {
    return super.getItems()
  }
}

export class Base027 {
  getCount(): number {
    return 0
  }
}

export class Child027 extends Base027 {
  getCount(): number {
    return super.getCount()
  }
}

export class Base028 {
  getValue(): number {
    return 100
  }
}

export class Child028 extends Base028 {
  getValue(): number {
    return super.getValue()
  }

  checkType(): boolean {
    return typeof super.getValue() === 'number'
  }
}

export class Base029 {
  getInfo(): { id: number; name: string } {
    return { id: 1, name: 'base' }
  }
}

export class Child029 extends Base029 {
  getInfo(): { id: number; name: string } {
    return super.getInfo()
  }
}

export class Base030 {
  getMax(): number {
    return Number.MAX_VALUE
  }
}

export class Child030 extends Base030 {
  getMax(): number {
    return super.getMax()
  }
}

export class Base031 {
  async getValue(): Promise<number> {
    return 42
  }
}

export class Child031 extends Base031 {
  async getValue(): Promise<number> {
    return super.getValue()
  }
}

export class Base037 {
  constructor(value: number) {
    if (value < 0) {
      throw new Error('value cannot be negative')
    }
  }
}

export class Child037 extends Base037 {
  constructor(value: number) {
    super(value)
  }
}

export class Base038 {
  divide(a: number, b: number): number {
    if (b === 0) {
      throw new Error('division by zero')
    }
    return a / b
  }
}

export class Child038 extends Base038 {
  divide(a: number, b: number): number {
    return super.divide(a, b)
  }
}

export class Base041 {
  cleanup(): void {
  }
}

export class Child041 extends Base041 {
  cleanup(): void {
    try {
    } finally {
      super.cleanup()
    }
  }
}

export class AppError042 extends Error {
  constructor(message: string, public code: number) {
    super(message)
    this.name = 'AppError042'
  }
}

export class Lifecycle046 {
  log: string[] = []

  onCreate(): void {
    this.log.push('base:onCreate')
  }

  onDestroy(): void {
    this.log.push('base:onDestroy')
  }
}

export class Page046 extends Lifecycle046 {
  onCreate(): void {
    super.onCreate()
    this.log.push('page:onCreate')
  }

  onDestroy(): void {
    this.log.push('page:onDestroy')
    super.onDestroy()
  }
}

export class BaseRepository047<T extends { id: number }> {
  protected items: T[] = []

  findAll(): T[] {
    return this.items
  }

  findById(id: number): T | undefined {
    return this.items.find(i => i.id === id)
  }

  save(item: T): void {
    this.items.push(item)
  }
}

export class UserRepository047 extends BaseRepository047<{ id: number; name: string }> {
  findByName(name: string): { id: number; name: string } | undefined {
    return super.findAll().find(u => u.name === name)
  }

  save(item: { id: number; name: string }): void {
    super.save(item)
  }
}

export class LogFormatter048 {
  format(level: string, msg: string): string {
    return `[${level}] ${msg}`
  }
}

export class TimestampedFormatter048 extends LogFormatter048 {
  format(level: string, msg: string): string {
    return `${super.format(level, msg)} [${Date.now()}]`
  }
}

export class Middleware049 {
  handle(request: { token: string; user?: string }): boolean {
    return request.token !== ''
  }
}

export class AuthMiddleware049 extends Middleware049 {
  handle(request: { token: string; user?: string }): boolean {
    if (!super.handle(request)) {
      return false
    }
    return request.user !== undefined && request.user !== ''
  }
}

export class AdminMiddleware049 extends AuthMiddleware049 {
  handle(request: { token: string; user?: string; role?: string }): boolean {
    if (!super.handle(request)) {
      return false
    }
    return request.role === 'admin'
  }
}

export class Validator050 {
  validate(value: string): string[] {
    let errors: string[] = []
    if (value.length === 0) {
      errors.push('required')
    }
    return errors
  }
}

export class LengthValidator050 extends Validator050 {
  constructor(public min: number, public max: number) {
    super()
  }

  validate(value: string): string[] {
    let errors = super.validate(value)
    if (value.length < this.min) {
      errors.push('too short')
    }
    if (value.length > this.max) {
      errors.push('too long')
    }
    return errors
  }
}

export class PasswordValidator050 extends LengthValidator050 {
  constructor() {
    super(8, 64)
  }

  validate(value: string): string[] {
    let errors = super.validate(value)
    if (!/[A-Z]/.test(value)) {
      errors.push('need uppercase')
    }
    return errors
  }
}

export class EventEmitter051 {
  private listeners: Map<string, Function[]> = new Map()

  on(event: string, fn: Function): void {
    if (!this.listeners.has(event)) {
      this.listeners.set(event, [])
    }
    this.listeners.get(event)!.push(fn)
  }

  emit(event: string, data: Object): void {
    this.listeners.get(event)?.forEach(fn => fn(data))
  }
}

export class Store051 extends EventEmitter051 {
  private state: Object = {}

  setState(key: string, value: Object): void {
    this.state[key] = value
    super.emit(key, value)
  }
}

export class Config052 {
  protected settings: Record<string, Object> = {}

  constructor(defaults: Record<string, Object>) {
    this.settings = defaults
  }

  get(key: string): Object | undefined {
    return this.settings[key]
  }
}

export class DatabaseConfig052 extends Config052 {
  constructor(overrides: Record<string, Object> = {}) {
    super({ host: 'localhost', port: 5432, ...overrides })
  }
}

export class ProductionDbConfig052 extends DatabaseConfig052 {
  constructor() {
    super({ host: 'prod-db.local', port: 6543 })
  }

  get(key: string): Object | undefined {
    return super.get(key)
  }
}

export class TaxCalculator053 {
  calculate(amount: number): number {
    return amount * 0.1
  }
}

export class RegionalTaxCalculator053 extends TaxCalculator053 {
  constructor(public rate: number) {
    super()
  }

  calculate(amount: number): number {
    return super.calculate(amount) + amount * this.rate
  }
}

export class LuxuryTaxCalculator053 extends RegionalTaxCalculator053 {
  constructor(rate: number, public luxuryThreshold: number) {
    super(rate)
  }

  calculate(amount: number): number {
    let base = super.calculate(amount)
    if (amount > this.luxuryThreshold) {
      base += (amount - this.luxuryThreshold) * 0.2
    }
    return base
  }
}

export class StateMachine054 {
  protected current: string = 'idle'
  protected transitions: Map<string, string> = new Map([
    ['idle->running', 'running'],
    ['running->stopped', 'stopped']
  ])

  transition(event: string): string {
    let key = `${this.current}->${event}`
    let next = this.transitions.get(key)
    if (next) {
      this.current = next
    }
    return this.current
  }
}

export class LoggingStateMachine054 extends StateMachine054 {
  transition(event: string): string {
    let prev = this.current
    let next = super.transition(event)
    if (prev !== next) {
    }
    return next
  }
}

export class Base055 {
  greet(): string {
    return 'hello'
  }
}

export class Child055 extends Base055 {
  public override greet(): string {
    return super.greet() + ' from child'
  }
}

interface Serializable059 { serialize(): string }

export class Base059 {
  constructor(public id: number) {
  }
}

export class Entity059 extends Base059 implements Serializable059 {
  constructor(id: number, public name: string) {
    super(id)
  }

  serialize(): string {
    return `{"id":${this.id},"name":"${this.name}"}`
  }
}

export class Collection060<T> {
  constructor(protected items: T[] = []) {
  }

  add(item: T): void {
    this.items.push(item)
  }

  getAll(): T[] {
    return this.items
  }
}

export class SortedCollection060<T extends number> extends Collection060<T> {
  add(item: T): void {
    super.add(item)
    this.items.sort((a, b) => a - b)
  }
}

export class Base063 {
  log: string[] = []

  operation(): void {
    this.log.push('Base063')
  }
}

export class MixinA063 extends Base063 {
  operation(): void {
    super.operation()
    this.log.push('MixinA063')
  }
}

export class MixinB063 extends MixinA063 {
  operation(): void {
    super.operation()
    this.log.push('MixinB063')
  }
}

export class Concrete063 extends MixinB063 {
  operation(): void {
    super.operation()
    this.log.push('Concrete063')
  }
}

export class A064 {
  constructor(public v: number) {
  }
}

export class B064 extends A064 {
  constructor(v: number) {
    super(v)
  }
}

export class L1065 {
  constructor(public v: number = 1) {
  }
}

export class L2065 extends L1065 {
  constructor() {
    super(2)
  }
}

export class L3065 extends L2065 {
  constructor() {
    super()
  }
}

export class L4065 extends L3065 {
  constructor() {
    super()
  }
}

export class L5065 extends L4065 {
  constructor() {
    super()
  }
}

export class Base066 {
  protected value: string = 'base'

  getValue(): string {
    return this.value
  }
}

export class Child066 extends Base066 {
  protected value: string = 'child'

  getChildValue(): string {
    return this.value
  }

  getBaseValue(): string {
    return super.getValue()
  }
}

export class Base067 {
  shared(): string {
    return 'shared'
  }
}

export class Mid067 extends Base067 {
  shared(): string {
    return 'mid-' + super.shared()
  }
}

export class Leaf067 extends Mid067 {
  shared(): string {
    return 'leaf-' + super.shared()
  }
}

export class Base068 {
  constructor(public v: number = 10) {
  }
}

export class Child068 extends Base068 {
}

export class Base069 {
  public name: string = 'default'
}

export class Child069 extends Base069 {
  constructor() {
    super()
  }
}

export class Base070 {
  constructor(public a: number) {
  }
}

export class Child070 extends Base070 {
  public b: number

  constructor(a: number, b: number) {
    super(a)
    this.b = b
  }

  sum(): number {
    return this.a + this.b
  }
}

export class Base071 {
  init(): void {
  }
}

export class Child071 extends Base071 {
  public ready: boolean = false

  init(): void {
    super.init()
    this.ready = true
  }
}

export class Base072 {
  constructor(public name: string | null) {
    if (name === null) {
      throw new Error('name required')
    }
  }
}

export class Child072 extends Base072 {
  constructor(name: string | null) {
    super(name)
  }
}

export class Base073 {
  constructor(public value: number = 0) {
  }
}

export class Child073 extends Base073 {
  constructor(v?: number) {
    super(v)
  }
}

export class Base074 {
  constructor(public name: string) {
    if (name.length === 0) {
      throw new Error('empty name')
    }
  }
}

export class Child074 extends Base074 {
  constructor(name: string) {
    super(name)
  }
}

export class Base075 {
  constructor(public data: string) {
    if (data.length > 1000) {
      throw new Error('data too long')
    }
  }
}

export class Child075 extends Base075 {
  constructor(data: string) {
    super(data)
  }
}

export class Base077 {
  constructor(public input: string) {
  }
}

export class Child077 extends Base077 {
  constructor(input: string) {
    super(input)
  }

  sanitized(): string {
    return this.input.replace(/</g, '&lt;')
  }
}

export class Base078 {
  protected validate(x: number): boolean {
    return x > 0
  }
}

export class Child078 extends Base078 {
  check(x: number): boolean {
    return super.validate(x)
  }
}

export class Base079 {
  public readonly id: number

  constructor(id: number) {
    this.id = id
  }
}

export class Child079 extends Base079 {
  constructor(id: number) {
    super(id)
  }

  getId(): number {
    return super.id
  }
}

export class Base081 {
  private _count: number = 0

  protected get count(): number {
    return this._count
  }
}

export class Child081 extends Base081 {
  getCount(): number {
    return super.count
  }
}

export class Base082 {
  constructor(public value: string | number) {
  }
}

export class Child082 extends Base082 {
  constructor(v: string | number) {
    super(v)
  }
}

interface A083 { a: number }

interface B083 { b: string }

export class Base083 {
  constructor(public data: A083 & B083) {
  }
}

export class Child083 extends Base083 {
  constructor(data: A083 & B083) {
    super(data)
  }
}

export class Base084 {
  constructor(public level: 'info' | 'warn' | 'error') {
  }
}

export class Child084 extends Base084 {
  constructor(level: 'info' | 'warn' | 'error') {
    super(level)
  }
}

export class Base086 {
  constructor(public pair: [string, number]) {
  }
}

export class Child086 extends Base086 {
  constructor(p: [string, number]) {
    super(p)
  }
}

export class Base087 {
  protected data: number[] = [1, 2, 3]

  nextItem(index: number): number | undefined {
    return this.data[index]
  }
}

export class Child087 extends Base087 {
  nextItem(index: number): number | undefined {
    let v = super.nextItem(index)
    return v !== undefined ? v * 10 : undefined
  }
}

export class Base088 {
  accumulate(start: number, end: number): number {
    let sum = 0
    for (let i = start; i <= end; i++) {
      sum += i
    }
    return sum
  }
}

export class Child088 extends Base088 {
  accumulate(start: number, end: number): number {
    return super.accumulate(start, end) * 2
  }
}

export class Base089 {
  reverse(items: number[]): number[] {
    let out: number[] = []
    for (let i = items.length - 1; i >= 0; i--) {
      out.push(items[i])
    }
    return out
  }
}

export class Child089 extends Base089 {
  reverse(items: number[]): number[] {
    return super.reverse(items).map(x => x + 1)
  }
}

export class Base090 {
  chunk(items: number[], size: number): number[][] {
    let out: number[][] = []
    for (let i = 0; i < items.length; i += size) {
      out.push(items.slice(i, i + size))
    }
    return out
  }
}

export class Child090 extends Base090 {
  chunk(items: number[], size: number): number[][] {
    return super.chunk(items, size).map(c => c.reverse())
  }
}

export class MyArray091 extends Array<number> {
  constructor(...items: number[]) {
    super(...items)
  }

  sum(): number {
    let total = 0
    for (let i = 0; i < this.length; i++) {
      total += this[i]
    }
    return total
  }
}

export class AppError092 extends Error {
  public code: number

  constructor(message: string, code: number) {
    super(message)
    this.code = code
    this.name = 'AppError092'
  }
}

export class CountedMap093 extends Map<string, number> {
  set(key: string, value: number): this {
    return super.set(key, value)
  }

  inc(key: string): this {
    let cur = super.get(key) ?? 0
    return super.set(key, cur + 1)
  }
}

export class ObservableSet094<T> extends Set<T> {
  public opCount: number = 0

  add(value: T): this {
    this.opCount++
    return super.add(value)
  }
}

export class TaggedRegExp095 extends RegExp {
  public tag: string

  constructor(pattern: string, tag: string) {
    super(pattern)
    this.tag = tag
  }

  testTag(input: string): boolean {
    return super.test(input)
  }
}

export class QueryBuilder098 {
  protected parts: string[] = []

  select(cols: string): this {
    this.parts.push('SELECT ' + cols);
    return this
  }

  build(): string {
    return this.parts.join(' ')
  }
}

export class WhereBuilder098 extends QueryBuilder098 {
  where(cond: string): this {
    this.parts.push('WHERE ' + cond);
    return this
  }

  build(): string {
    return super.build() + ';'
  }
}

export class Command100 {
  execute(): void {
  }

  undo(): void {
  }
}

export class LoggedCommand100 extends Command100 {
  public log: string[] = []

  execute(): void {
    this.log.push('exec')
    super.execute()
  }

  undo(): void {
    this.log.push('undo')
    super.undo()
  }
}

export class Adaptee101 {
  specificRequest(): string {
    return 'specific'
  }
}

export class Adapter101 extends Adaptee101 {
  request(): string {
    return 'adapted:' + super.specificRequest()
  }
}

export class Component102 {
  operation(): string {
    return 'base'
  }
}

export class BorderDecorator102 extends Component102 {
  operation(): string {
    return '[' + super.operation() + ']'
  }
}

export class ColorDecorator102 extends BorderDecorator102 {
  operation(): string {
    return '<red>' + super.operation() + '</red>'
  }
}

export class Base103 {
  greet(): string {
    return 'hi'
  }
}

export class Child103 extends Base103 {
  test(): string {
    // ❌ 编译错误: super不能与可选链一起使用
    // return super?.greet()
    return super.greet()
  }
}

export class Base104 {
  isReady(): boolean {
    return true
  }
}

export class Child104 extends Base104 {
  status(): string {
    return super.isReady() ? 'ready' : 'not'
  }
}

export class Base105 {
  name(): string {
    return 'Base105'
  }
}

export class Child105 extends Base105 {
  describe(): string {
    return `child of ${super.name()}`
  }
}

export class Base106 {
  getValue(): number {
    return 100
  }
}

export class Child106 extends Base106 {
  getValue(): number {
    return super.getValue() + 50
  }

  doubled(): number {
    return super.getValue() * 2
  }
}

export class Base107 {
  tag(): string {
    return 'B'
  }
}

export class Mid107 extends Base107 {
  tag(): string {
    return 'M' + super.tag()
  }
}

export class Leaf107 extends Mid107 {
  tag(): string {
    return 'L' + super.tag()
  }
}

export class Base108 {
  toString(): string {
    return 'Base108'
  }
}

export class Child108 extends Base108 {
  toString(): string {
    return 'Child108(' + super.toString() + ')'
  }
}

export class Base109 {
  valueOf(): number {
    return 42
  }
}

export class Child109 extends Base109 {
  valueOf(): number {
    return super.valueOf() + 8
  }
}

export class Base110 {
  toJSON(): string {
    return '{"type":"base"}'
  }
}

export class Child110 extends Base110 {
  toJSON(): string {
    return '{"type":"child","parent":' + super.toJSON() + '}'
  }
}

export class L1111 {
  constructor(public v: number = 1) {
  }
}

export class L2111 extends L1111 {
  constructor() {
    super(2)
  }
}

export class L3111 extends L2111 {
  constructor() {
    super()
  }
}

export class L4111 extends L3111 {
  constructor() {
    super()
  }
}

export class L5111 extends L4111 {
  constructor() {
    super()
  }
}

export class L6111 extends L5111 {
  constructor() {
    super()
  }
}

export class L7111 extends L6111 {
  constructor() {
    super()
  }
}

export class L8111 extends L7111 {
  constructor() {
    super()
  }
}

export class L9111 extends L8111 {
  constructor() {
    super()
  }
}

export class L10111 extends L9111 {
  constructor() {
    super()
  }
}

export class Calculator112 {
  sum(n: number): number {
    let total = 0
    for (let i = 1; i <= n; i++) {
      total += i
    }
    return total
  }
}

export class CachedCalculator112 extends Calculator112 {
  private cache: Map<number, number> = new Map()

  sum(n: number): number {
    let hit = this.cache.get(n)
    if (hit !== undefined) {
      return hit
    }
    let result = super.sum(n)
    this.cache.set(n, result)
    return result
  }
}

export class Base113 {
  transform(x: number): number {
    return x * x
  }
}

export class Child113 extends Base113 {
  transform(x: number): number {
    return super.transform(x) + 1
  }

  batch(items: number[]): number[] {
    let out: number[] = []
    for (let i = 0; i < items.length; i++) {
      out.push(this.transform(items[i]))
    }
    return out
  }
}

export class Base114 {
  public parent: Base114 | null = null

  setParent(p: Base114 | null): void {
    this.parent = p
  }
}

export class Child114 extends Base114 {
  setParent(p: Base114 | null): void {
    super.setParent(p)
  }
}

export class Base115 {
  process(data: string): string {
    return data.toUpperCase()
  }
}

export class Child115 extends Base115 {
  process(data: string): string {
    return super.process(data).toLowerCase()
  }
}

export class Base116 {
  greet(name: string): string {
    return 'Hello ' + name
  }

  greetTitle(name: string, title: string): string {
    return title + ' ' + name
  }
}

export class Child116 extends Base116 {
  greet(name: string): string {
    return super.greet(name) + '!'
  }

  greetTitle(name: string, title: string): string {
    return super.greetTitle(name, title) + '!'
  }
}

export class Base117 {
  constructor(public id: number) {
  }
}

export class Child117 extends Base117 {
  public label: string

  constructor(id: number) {
    super(id)
    this.label = 'item-' + this.id
  }
}

export class Base118 {
  static counter: number = 0

  constructor(public id: number) {
  }
}

export class Child118 extends Base118 {
  constructor() {
    super(Base118.counter++)
  }
}

export class Base119 {
  greet(): string {
    return 'hi'
  }
}

export class Child119 extends Base119 {
  // ❌ 编译错误: 字段初始化器中不能使用super
  // greeting: string = super.greet()
  public greeting: string = ''

  constructor() {
    super()
    this.greeting = super.greet()
  }
}

interface Comparable120 { compareTo(other: Item120): number }

interface Printable120 { print(): string }

export class Base120 {
  constructor(public id: number) {
  }
}

export class Item120 extends Base120 implements Comparable120, Printable120 {
  compareTo(other: Item120): number {
    return this.id - other.id
  }

  print(): string {
    return 'Item120#' + this.id
  }
}

interface Serializer121 { serialize(): string }

export class Base121 implements Serializer121 {
  serialize(): string {
    return 'base'
  }
}

export class Child121 extends Base121 {
  serialize(): string {
    return super.serialize() + ':child'
  }
}

export class Base122 {
  fetch(): Promise<string> {
    return Promise.resolve('data')
  }
}

export class Child122 extends Base122 {
  fetch(): Promise<string> {
    return super.fetch().then(r => r + '+child')
  }
}

export class Base123 {
  fetchUsers(): Promise<string[]> {
    return Promise.resolve(['Alice', 'Bob'])
  }

  fetchPosts(): Promise<string[]> {
    return Promise.resolve(['p1', 'p2'])
  }
}

export class Child123 extends Base123 {
  fetchAll(): Promise<string[][]> {
    return Promise.all([super.fetchUsers(), super.fetchPosts()])
  }
}

export class Base124 {
  async step1(): Promise<string> {
    return 's1'
  }

  async step2(input: string): Promise<string> {
    return input + '-s2'
  }
}

export class Child124 extends Base124 {
  async run(): Promise<string> {
    let r1 = await super.step1()
    let r2 = await super.step2(r1)
    return r2
  }
}

export class Base125 {
  protected readonly config: Record<string, Object> = { version: 1 }

  getVersion(): number {
    return this.config['version'] as number
  }
}

export class Child125 extends Base125 {
  getVersion(): number {
    return super.getVersion()
  }
}

export class Base128 {
  constructor(public value: number) {
  }

  isValid(): boolean {
    return !Number.isNaN(this.value)
  }
}

export class Child128 extends Base128 {
  constructor(v: number) {
    super(v)
  }

  isValid(): boolean {
    return super.isValid()
  }
}

export class Base129 {
  constructor(public value: number) {
  }

  isFinite(): boolean {
    return Number.isFinite(this.value)
  }
}

export class Child129 extends Base129 {
  constructor(v: number) {
    super(v)
  }

  isFinite(): boolean {
    return super.isFinite()
  }
}

export class Base130 {
  constructor(public value: number) {
  }

  isNegativeZero(): boolean {
    return Object.is(this.value, -0)
  }
}

export class Child130 extends Base130 {
  constructor(v: number) {
    super(v)
  }

  isNegativeZero(): boolean {
    return super.isNegativeZero()
  }
}

export class Base131 {
  constructor(public value: number) {
  }

  isMinPositive(): boolean {
    return this.value === Number.MIN_VALUE
  }
}

export class Child131 extends Base131 {
  constructor(v: number) {
    super(v)
  }

  isMinPositive(): boolean {
    return super.isMinPositive()
  }
}

export class Base132 {
  constructor(public value: number) {
  }

  isSafe(): boolean {
    return Number.isSafeInteger(this.value)
  }
}

export class Child132 extends Base132 {
  constructor(v: number) {
    super(v)
  }

  isSafe(): boolean {
    return super.isSafe()
  }
}

export class Base133 {
  constructor(public text: string) {
  }

  length(): number {
    return this.text.length
  }
}

export class Child133 extends Base133 {
  constructor(t: string) {
    super(t)
  }

  length(): number {
    return super.length()
  }
}

export class Base134 {
  constructor(public text: string) {
  }

  charCount(): number {
    return [...this.text].length
  }
}

export class Child134 extends Base134 {
  constructor(t: string) {
    super(t)
  }

  charCount(): number {
    return super.charCount()
  }
}

export class Base135 {
  constructor(public text: string) {
  }

  isEmpty(): boolean {
    return this.text.trim().length === 0
  }
}

export class Child135 extends Base135 {
  constructor(t: string) {
    super(t)
  }

  isEmpty(): boolean {
    return super.isEmpty()
  }
}

export class Base136 {
  constructor(public data: string) {
  }

  truncate(max: number): string {
    return this.data.length > max ? this.data.substring(0, max) : this.data
  }
}

export class Child136 extends Base136 {
  constructor(d: string) {
    super(d)
  }

  truncate(max: number): string {
    return super.truncate(max) + '...'
  }
}

export class Base137 {
  constructor(public nums: number[]) {
  }
}

export class Child137 extends Base137 {
  constructor(...nums: number[]) {
    super([...nums])
  }
}

export class Base140 {
  process(input: { x: number; y: number }): number {
    return input.x + input.y
  }
}

export class Child140 extends Base140 {
  process(input: { x: number; y: number }): number {
    let { x, y } = input
    return super.process({ x: x * 2, y: y * 2 })
  }
}

export class Base141 {
  get(): string | number {
    return 42
  }
}

export class Child141 extends Base141 {
  getNumber(): number {
    let v = super.get()
    if (typeof v === 'number') {
      return v
    }
    return 0
  }
}

type Result142 = { status: 'ok'; data: number } | { status: 'err'; msg: string }

export class Base142 {
  fetch(): Result142 {
    return { status: 'ok', data: 100 }
  }
}

export class Child142 extends Base142 {
  getData(): number {
    let r = super.fetch()
    if (r.status === 'ok') {
      return r.data
    }
    return -1
  }
}

export class Base143 {
  create(): Object {
    return { value: 42 }
  }
}

export class Child143 extends Base143 {
  asRecord(): Record<string, Object> | null {
    let v = super.create()
    if (v instanceof Object) {
      return v as Record<string, Object>
    }
    return null
  }
}

export class Base144 {
  map(arr: number[], fn: (x: number) => number): number[] {
    let out: number[] = []
    for (let i = 0; i < arr.length; i++) {
      out.push(fn(arr[i]))
    }
    return out
  }
}

export class Child144 extends Base144 {
  double(arr: number[]): number[] {
    return this.map(arr, x => x * 2)
  }

  map(arr: number[], fn: (x: number) => number): number[] {
    return super.map(arr, fn)
  }
}

export class Base145 {
  multiplier(factor: number): (x: number) => number {
    return (x: number) => x * factor
  }
}

export class Child145 extends Base145 {
  multiplier(factor: number): (x: number) => number {
    let fn = super.multiplier(factor)
    return (x: number) => fn(x) + 1
  }
}

export class Base146 {
  normalize(x: number): number {
    return x < 0 ? 0 : x
  }
}

export class Child146 extends Base146 {
  normalize(x: number): number {
    return super.normalize(x)
  }

  batch(arr: number[]): number[] {
    return arr.map(x => this.normalize(x))
  }
}

export class Base147 {
  protected base: number = 10

  getter(): () => number {
    return () => this.base
  }
}

export class Child147 extends Base147 {
  getter(): () => number {
    let parentFn = super.getter()
    return () => parentFn() + 5
  }
}

export class Base148 {
  transform(arr: number[]): number[] {
    return arr.map(x => x + 1)
  }
}

export class Child148 extends Base148 {
  transform(arr: number[]): number[] {
    return super.transform(arr).map(x => x * 2)
  }
}

export class Base149 {
  filterPositive(arr: number[]): number[] {
    return arr.filter(x => x > 0)
  }
}

export class Child149 extends Base149 {
  filterPositive(arr: number[]): number[] {
    return super.filterPositive(arr).filter(x => x < 10)
  }
}

export class Base150 {
  sortAsc(arr: number[]): number[] {
    return arr.slice().sort((a, b) => a - b)
  }
}

export class Child150 extends Base150 {
  sortAsc(arr: number[]): number[] {
    return super.sortAsc(arr)
  }

  sortDesc(arr: number[]): number[] {
    return super.sortAsc(arr).reverse()
  }
}

export class Base151 {
  sortByAge(items: { age: number }[]): { age: number }[] {
    return items.slice().sort((a, b) => a.age - b.age)
  }
}

export class Child151 extends Base151 {
  sortByAge(items: { age: number }[]): { age: number }[] {
    return super.sortByAge(items)
  }

  sortByAgeDesc(items: { age: number }[]): { age: number }[] {
    return super.sortByAge(items).reverse()
  }
}

export class Stack152 {
  protected items: number[] = []

  push(v: number): void {
    this.items.push(v)
  }

  pop(): number | undefined {
    return this.items.pop()
  }

  size(): number {
    return this.items.length
  }
}

export class LoggingStack152 extends Stack152 {
  public log: string[] = []

  push(v: number): void {
    this.log.push('push:' + v)
    super.push(v)
  }

  pop(): number | undefined {
    let v = super.pop()
    this.log.push('pop:' + v)
    return v
  }
}

export class Queue153 {
  protected items: number[] = []

  enqueue(v: number): void {
    this.items.push(v)
  }

  dequeue(): number | undefined {
    return this.items.shift()
  }
}

export class BoundedQueue153 extends Queue153 {
  constructor(public capacity: number) {
    super()
  }

  enqueue(v: number): void {
    if (this.items.length >= this.capacity) {
      throw new Error('full')
    }
    super.enqueue(v)
  }
}

export class Node154 {
  constructor(public value: number, public next: Node154 | null = null) {
  }

  toString(): string {
    return 'Node154(' + this.value + ')'
  }
}

export class TrackedNode154 extends Node154 {
  public visited: boolean = false

  constructor(value: number, next: Node154 | null = null) {
    super(value, next)
  }

  toString(): string {
    return 'Tracked:' + super.toString()
  }
}

export class TreeNode155 {
  public children: TreeNode155[] = []

  constructor(public value: string) {
  }

  add(child: TreeNode155): void {
    this.children.push(child)
  }

  count(): number {
    let total = 1
    for (let c of this.children) {
      total += c.count()
    }
    return total
  }
}

export class NamedTreeNode155 extends TreeNode155 {
  constructor(value: string) {
    super(value)
  }

  add(child: TreeNode155): void {
    super.add(child)
  }

  count(): number {
    return super.count()
  }
}

export class GraphNode156 {
  public neighbors: GraphNode156[] = []

  constructor(public id: string) {
  }

  connect(other: GraphNode156): void {
    this.neighbors.push(other)
  }

  degree(): number {
    return this.neighbors.length
  }
}

export class DirectedNode156 extends GraphNode156 {
  constructor(id: string) {
    super(id)
  }

  connect(other: GraphNode156): void {
    super.connect(other)
  }

  degree(): number {
    return super.degree()
  }
}

export class Cache157 {
  protected store: Map<string, Object> = new Map()

  get(key: string): Object | undefined {
    return this.store.get(key)
  }

  set(key: string, value: Object): void {
    this.store.set(key, value)
  }
}

export class LRUCache157 extends Cache157 {
  constructor(public capacity: number) {
    super()
  }

  get(key: string): Object | undefined {
    let v = super.get(key)
    if (v !== undefined) {
      this.store.delete(key)
      super.set(key, v)
    }
    return v
  }

  set(key: string, value: Object): void {
    if (this.store.size >= this.capacity && !this.store.has(key)) {
      let firstKey = this.store.keys().next().value
      if (firstKey !== undefined) {
        this.store.delete(firstKey)
      }
    }
    super.set(key, value)
  }
}

export class Debouncer160 {
  protected timer: number | null = null

  schedule(fn: Function, delay: number): void {
    if (this.timer !== null) {
      clearTimeout(this.timer)
    }
    this.timer = setTimeout(fn, delay)
  }
}

export class CountedDebouncer160 extends Debouncer160 {
  public count: number = 0

  schedule(fn: Function, delay: number): void {
    this.count++
    super.schedule(fn, delay)
  }
}

export class Throttler161 {
  protected lastTime: number = 0

  tryCall(fn: Function, interval: number): boolean {
    let now = Date.now()
    if (now - this.lastTime >= interval) {
      this.lastTime = now
      fn()
      return true
    }
    return false
  }
}

export class LoggedThrottler161 extends Throttler161 {
  public calls: number = 0

  tryCall(fn: Function, interval: number): boolean {
    let result = super.tryCall(fn, interval)
    if (result) {
      this.calls++
    }
    return result
  }
}

export class Resource163 {
  protected opened: boolean = false

  open(): void {
    this.opened = true
  }

  close(): void {
    this.opened = false
  }

  isOpen(): boolean {
    return this.opened
  }
}

export class ManagedResource163 extends Resource163 {
  open(): void {
    super.open()
  }

  close(): void {
    super.close()
  }

  isOpen(): boolean {
    return super.isOpen()
  }
}

export class Handler164 {
  public log: string[] = []

  acquire(): void {
    this.log.push('acquire')
  }

  release(): void {
    this.log.push('release')
  }
}

export class OrderedHandler164 extends Handler164 {
  acquire(): void {
    super.acquire()
    this.log.push('after-acquire')
  }

  release(): void {
    this.log.push('before-release')
    super.release()
  }
}

export class Connection165 {
  protected open: boolean = false

  connect(): void {
    this.open = true
  }

  disconnect(): void {
    this.open = false
  }

  isConnected(): boolean {
    return this.open
  }
}

export class SafeConnection165 extends Connection165 {
  connect(): void {
    super.connect()
  }

  disconnect(): void {
    if (!this.isConnected()) {
      return
    }
    super.disconnect()
  }
}

export class CancellationToken169 {
  private cancelled: boolean = false

  cancel(): void {
    this.cancelled = true
  }

  isCancelled(): boolean {
    return this.cancelled
  }
}

export class Task169 {
  protected token: CancellationToken169

  constructor(token: CancellationToken169) {
    this.token = token
  }

  run(): string {
    if (this.token.isCancelled()) {
      return 'cancelled'
    }
    return 'completed'
  }
}

export class LoggedTask169 extends Task169 {
  run(): string {
    let result = super.run()
    return 'log:' + result
  }
}

export class DeepCloner171 {
  deep(src: Object): Object {
    return JSON.parse(JSON.stringify(src))
  }
}

export class TypedDeepCloner171 extends DeepCloner171 {
  deep(src: Object): Object {
    return super.deep(src)
  }
}

export class Base172 {
  merge(base: Record<string, Object>, override: Record<string, Object>): Record<string, Object> {
    return { ...base, ...override }
  }
}

export class Child172 extends Base172 {
  merge(base: Record<string, Object>, override: Record<string, Object>): Record<string, Object> {
    return { ...super.merge(base, override), merged: true }
  }
}

export class Base173 {
  equals(a: Object, b: Object): boolean {
    return a === b
  }
}

export class Child173 extends Base173 {
  equals(a: Object, b: Object): boolean {
    return super.equals(a, b)
  }
}

export class Base174 {
  valueEqual(a: number, b: number): boolean {
    return a === b || (Number.isNaN(a) && Number.isNaN(b))
  }
}

export class Child174 extends Base174 {
  valueEqual(a: number, b: number): boolean {
    return super.valueEqual(a, b)
  }
}

export class Entity175 {
  constructor(public id: number) {
  }

  equals(other: Entity175): boolean {
    return this.id === other.id
  }
}

export class TrackedEntity175 extends Entity175 {
  constructor(id: number) {
    super(id)
  }

  equals(other: TrackedEntity175): boolean {
    return super.equals(other)
  }
}

export class Config176 {
  protected defaults: Record<string, Object> = { host: 'localhost', port: 8080 }

  merge(overrides: Record<string, Object>): Record<string, Object> {
    return { ...this.defaults, ...overrides }
  }
}

export class ChildConfig176 extends Config176 {
  merge(overrides: Record<string, Object>): Record<string, Object> {
    return super.merge(overrides)
  }
}

export class Config177 {
  merge(base: Record<string, Object>, mid: Record<string, Object>,
    top: Record<string, Object>): Record<string, Object> {
    return { ...base, ...mid, ...top }
  }
}

export class StrictConfig177 extends Config177 {
  merge(base: Record<string, Object>, mid: Record<string, Object>,
    top: Record<string, Object>): Record<string, Object> {
    let r = super.merge(base, mid, top)
    return { ...r, source: 'strict' }
  }
}

export class DiscountStrategy178 {
  apply(price: number): number {
    return price
  }
}

export class PercentDiscount178 extends DiscountStrategy178 {
  constructor(public rate: number) {
    super()
  }

  apply(price: number): number {
    return super.apply(price) * (1 - this.rate)
  }
}

export class FixedDiscount178 extends DiscountStrategy178 {
  constructor(public amount: number) {
    super()
  }

  apply(price: number): number {
    return Math.max(0, super.apply(price) - this.amount)
  }
}

export class Handler180 {
  protected next: Handler180 | null = null

  setNext(h: Handler180): Handler180 {
    this.next = h;
    return h
  }

  handle(request: string): string {
    if (this.next !== null) {
      return this.next.handle(request)
    }
    return 'unhandled'
  }
}

export class AuthHandler180 extends Handler180 {
  handle(request: string): string {
    if (request === 'auth') {
      return 'auth-ok'
    }
    return super.handle(request)
  }
}

export class LogHandler180 extends Handler180 {
  handle(request: string): string {
    if (request === 'log') {
      return 'log-ok'
    }
    return super.handle(request)
  }
}

export class Component181 {
  operation(): string {
    return 'leaf'
  }
}

export class Composite181 extends Component181 {
  protected children: Component181[] = []

  add(c: Component181): void {
    this.children.push(c)
  }

  operation(): string {
    let parts: string[] = []
    for (let c of this.children) {
      parts.push(c.operation())
    }
    return '[' + parts.join(',') + ']'
  }
}

export class CountedComposite181 extends Composite181 {
  operation(): string {
    return super.operation() + '(n=' + this.children.length + ')'
  }
}

export class Memento182 {
  constructor(public state: string) {
  }
}

export class Originator182 {
  constructor(public state: string) {
  }

  save(): Memento182 {
    return new Memento182(this.state)
  }

  restore(m: Memento182): void {
    this.state = m.state
  }
}

export class TrackedOriginator182 extends Originator182 {
  public history: string[] = []

  save(): Memento182 {
    this.history.push(this.state)
    return super.save()
  }

  restore(m: Memento182): void {
    super.restore(m)
  }
}

export class Flyweight183 {
  constructor(public key: string) {
  }

  operation(extrinsic: number): string {
    return this.key + ':' + extrinsic
  }
}

export class TaggedFlyweight183 extends Flyweight183 {
  constructor(key: string) {
    super(key)
  }

  operation(extrinsic: number): string {
    return 'tag-' + super.operation(extrinsic)
  }
}

export class Prototype184 {
  clone(): Prototype184 {
    return new Prototype184()
  }

  describe(): string {
    return 'proto'
  }
}

export class ConcretePrototype184 extends Prototype184 {
  constructor(public id: number) {
    super()
  }

  clone(): ConcretePrototype184 {
    return new ConcretePrototype184(this.id)
  }

  describe(): string {
    return super.describe() + '#' + this.id
  }
}

export class Calculator185 {
  power(base: number, exp: number): number {
    return Math.pow(base, exp)
  }
}

export class SafeCalculator185 extends Calculator185 {
  power(base: number, exp: number): number {
    if (base === 0 && exp < 0) {
      throw new Error('division by zero')
    }
    return super.power(base, exp)
  }
}

export class Calculator186 {
  log(x: number): number {
    return Math.log(x)
  }
}

export class SafeCalculator186 extends Calculator186 {
  log(x: number): number {
    if (x <= 0) {
      throw new Error('log of non-positive')
    }
    return super.log(x)
  }
}

export class TrigBase187 {
  sin(x: number): number {
    return Math.sin(x)
  }

  cos(x: number): number {
    return Math.cos(x)
  }
}

export class TrigExt187 extends TrigBase187 {
  tan(x: number): number {
    let c = super.cos(x)
    if (Math.abs(c) < 1e-10) {
      throw new Error('tan undefined')
    }
    return super.sin(x) / c
  }
}

export class Stats188 {
  sum(arr: number[]): number {
    let total = 0
    for (let v of arr) {
      total += v
    }
    return total
  }
}

export class ExtendedStats188 extends Stats188 {
  mean(arr: number[]): number {
    if (arr.length === 0) {
      return 0
    }
    return super.sum(arr) / arr.length
  }

  variance(arr: number[]): number {
    if (arr.length === 0) {
      return 0
    }
    let m = this.mean(arr)
    let total = 0
    for (let v of arr) {
      total += (v - m) * (v - m)
    }
    return total / arr.length
  }
}

export class Flags189 {
  protected mask: number = 0

  set(flag: number): void {
    this.mask |= flag
  }

  has(flag: number): boolean {
    return (this.mask & flag) === flag
  }
}

export class TrackedFlags189 extends Flags189 {
  public changes: number = 0

  set(flag: number): void {
    super.set(flag)
    this.changes++
  }

  has(flag: number): boolean {
    return super.has(flag)
  }
}

export class BitField190 {
  protected bits: number = 0

  toggle(bit: number): void {
    this.bits ^= bit
  }

  isSet(bit: number): boolean {
    return (this.bits & bit) !== 0
  }
}

export class CountedBitField190 extends BitField190 {
  public toggles: number = 0

  toggle(bit: number): void {
    super.toggle(bit)
    this.toggles++
  }
}

export class Evaluator191 {
  and(a: boolean, b: () => boolean): boolean {
    return a && b()
  }

  or(a: boolean, b: () => boolean): boolean {
    return a || b()
  }
}

export class CountedEvaluator191 extends Evaluator191 {
  public calls: number = 0

  and(a: boolean, b: () => boolean): boolean {
    this.calls++
    return super.and(a, b)
  }

  or(a: boolean, b: () => boolean): boolean {
    this.calls++
    return super.or(a, b)
  }
}

export class Logic192 {
  nor(a: boolean, b: boolean): boolean {
    return !(a || b)
  }

  nand(a: boolean, b: boolean): boolean {
    return !(a && b)
  }
}

export class DeMorgan192 extends Logic192 {
  nor(a: boolean, b: boolean): boolean {
    return !a && !b
  }

  nand(a: boolean, b: boolean): boolean {
    return !a || !b
  }

  verify(a: boolean, b: boolean): boolean {
    return super.nor(a, b) === this.nor(a, b) && super.nand(a, b) === this.nand(a, b)
  }
}

export class DateFormatter193 {
  protected date: Date

  constructor(d: Date) {
    this.date = d
  }

  format(): string {
    return this.date.toISOString()
  }
}

export class Clock194 {
  protected hours: number

  constructor(h: number) {
    this.hours = h
  }

  getHours(): number {
    return this.hours
  }
}

export class OffsetClock194 extends Clock194 {
  constructor(h: number, public offset: number) {
    super(h)
  }

  getHours(): number {
    return (super.getHours() + this.offset + 24) % 24
  }
}

export class Duration195 {
  constructor(public ms: number) {
  }

  inSeconds(): number {
    return Math.floor(this.ms / 1000)
  }
}

export class DetailedDuration195 extends Duration195 {
  inSeconds(): number {
    return super.inSeconds()
  }

  inMinutes(): number {
    return Math.floor(super.inSeconds() / 60)
  }

  inHours(): number {
    return Math.floor(this.inMinutes() / 60)
  }
}

export class StringUtils196 {
  toCamel(input: string): string {
    let parts = input.split('_')
    let result = parts[0]
    for (let i = 1; i < parts.length; i++) {
      result += parts[i].charAt(0).toUpperCase() + parts[i].substring(1)
    }
    return result
  }
}

export class EnhancedStringUtils196 extends StringUtils196 {
  toCamel(input: string): string {
    return super.toCamel(input)
  }

  toPascal(input: string): string {
    let camel = super.toCamel(input)
    return camel.charAt(0).toUpperCase() + camel.substring(1)
  }
}

export class Template197 {
  protected vars: Record<string, string> = {}

  setVar(name: string, value: string): void {
    this.vars[name] = value
  }

  render(tpl: string): string {
    let result = tpl
    for (let key in this.vars) {
      result = result.replace('${' + key + '}', this.vars[key])
    }
    return result
  }
}

export class SafeTemplate197 extends Template197 {
  render(tpl: string): string {
    let rendered = super.render(tpl)
    return rendered.replace('${', '').replace('}', '')
  }
}

export class Encoder198 {
  encode(s: string): string {
    return s.replace(/</g, '&lt;').replace(/>/g, '&gt;')
  }
}

export class StrictEncoder198 extends Encoder198 {
  encode(s: string): string {
    return super.encode(s).replace(/"/g, '&quot;')
  }
}

export class JsonReader199 {
  read(json: string): Object {
    return JSON.parse(json)
  }
}

export class SafeJsonReader199 extends JsonReader199 {
  read(json: string): Object {
    try {
      return super.read(json)
    } catch (error) {
      return {}
    }
  }

  readPath(json: string, path: string[]): Object | undefined {
    let obj = super.read(json) as Record<string, Object>
    let cur: Object | undefined = obj
    for (let key of path) {
      if (cur === undefined || !(cur instanceof Object)) {
        return undefined
      }
      cur = (cur as Record<string, Object>)[key]
    }
    return cur
  }
}

export class JsonFormatter200 {
  stringify(obj: Object): string {
    return JSON.stringify(obj)
  }
}

export class PrettyJsonFormatter200 extends JsonFormatter200 {
  stringify(obj: Object): string {
    return super.stringify(obj).replace(',', ',\n  ').replace('{', '{\n  ')
  }
}

export class Pool201 {
  protected items: Object[] = []

  acquire(): Object | undefined {
    return this.items.pop()
  }

  release(item: Object): void {
    this.items.push(item)
  }
}

export class CountedPool201 extends Pool201 {
  public acquired: number = 0
  public released: number = 0

  acquire(): Object | undefined {
    this.acquired++
    return super.acquire()
  }

  release(item: Object): void {
    this.released++
    super.release(item)
  }
}

export class Pool202 {
  protected items: Object[] = []

  acquire(): Object | undefined {
    return this.items.pop()
  }

  release(item: Object): void {
    this.items.push(item)
  }
}

export class BoundedPool202 extends Pool202 {
  private inUse: number = 0

  constructor(public max: number) {
    super()
  }

  acquire(): Object | undefined {
    if (this.inUse >= this.max) {
      return undefined
    }
    this.inUse++
    return super.acquire()
  }

  release(item: Object): void {
    this.inUse--
    super.release(item)
  }
}

export class Service203 {
  fetch(id: number): string {
    return 'item-' + id
  }
}

export class CachedService203 extends Service203 {
  private cache: Map<number, string> = new Map()

  fetch(id: number): string {
    let hit = this.cache.get(id)
    if (hit !== undefined) {
      return hit
    }
    let result = super.fetch(id)
    this.cache.set(id, result)
    return result
  }
}

export class Target204 {
  operation(x: number): number {
    return x * 2
  }
}

export class ProxyTarget204 extends Target204 {
  public log: string[] = []

  operation(x: number): number {
    this.log.push('before:' + x)
    let result = super.operation(x)
    this.log.push('after:' + result)
    return result
  }
}

export class Interceptor205 {
  process(input: string): string {
    return input
  }
}

export class PreInterceptor205 extends Interceptor205 {
  process(input: string): string {
    return super.process('[' + input + ']')
  }
}

export class Interceptor206 {
  process(input: string): string {
    return input
  }
}

export class PostInterceptor206 extends Interceptor206 {
  process(input: string): string {
    let result = super.process(input)
    return result + '|done'
  }
}

export class EventHandler207 {
  protected bubble: boolean = true

  handle(event: string): string[] {
    return [event]
  }
}

export class BubblingHandler207 extends EventHandler207 {
  handle(event: string): string[] {
    let result = super.handle(event)
    result.push('bubble:' + event)
    return result
  }
}

export class EventHandler208 {
  handle(event: string): string[] {
    return [event]
  }
}

export class CapturingHandler208 extends EventHandler208 {
  handle(event: string): string[] {
    let result = ['capture:' + event]
    result = result.concat(super.handle(event))
    return result
  }
}

export class EventHandler209 {
  protected propagationStopped: boolean = false

  handle(event: string): string {
    return 'handled:' + event
  }

  stopPropagation(): void {
    this.propagationStopped = true
  }

  isStopped(): boolean {
    return this.propagationStopped
  }
}

export class StoppableHandler209 extends EventHandler209 {
  handle(event: string): string {
    let result = super.handle(event)
    super.stopPropagation()
    return result
  }
}

export class PriorityQueue210 {
  protected items: { value: string; priority: number }[] = []

  enqueue(item: { value: string; priority: number }): void {
    this.items.push(item)
    this.items.sort((a, b) => b.priority - a.priority)
  }

  dequeue(): { value: string; priority: number } | undefined {
    return this.items.shift()
  }
}

export class LoggingPriorityQueue210 extends PriorityQueue210 {
  public ops: number = 0

  enqueue(item: { value: string; priority: number }): void {
    super.enqueue(item)
    this.ops++
  }
}

export class Dispatcher211 {
  dispatch(targets: { name: string; weight: number }[], total: number): Record<string, number> {
    let result: Record<string, number> = {}
    let sum = 0
    for (let t of targets) {
      sum += t.weight
    }
    for (let t of targets) {
      result[t.name] = Math.floor(total * t.weight / sum)
    }
    return result
  }
}

export class RoundingDispatcher211 extends Dispatcher211 {
  dispatch(targets: { name: string; weight: number }[], total: number): Record<string, number> {
    return super.dispatch(targets, total)
  }
}

export class Counter212 {
  protected value: number = 0
  protected locked: boolean = false

  increment(): number {
    while (this.locked) {
    }
    this.locked = true
    this.value++
    this.locked = false
    return this.value
  }
}

export class AuditedCounter212 extends Counter212 {
  public ops: number = 0

  increment(): number {
    let v = super.increment()
    this.ops++
    return v
  }
}

export class Mutex213 {
  protected owner: string | null = null

  acquire(owner: string): boolean {
    if (this.owner !== null) {
      return false
    }
    this.owner = owner
    return true
  }

  release(owner: string): void {
    if (this.owner === owner) {
      this.owner = null
    }
  }
}

export class TrackedMutex213 extends Mutex213 {
  public acquires: number = 0

  acquire(owner: string): boolean {
    let ok = super.acquire(owner)
    if (ok) {
      this.acquires++
    }
    return ok
  }
}

export class Store214 {
  protected data: Record<string, Object> = {}

  read(key: string): Object | undefined {
    return this.data[key]
  }

  write(key: string, value: Object): void {
    this.data[key] = value
  }
}

export class VersionedStore214 extends Store214 {
  private version: number = 0

  write(key: string, value: Object): void {
    super.write(key, value)
    this.version++
  }

  read(key: string): Object | undefined {
    return super.read(key)
  }

  getVersion(): number {
    return this.version
  }
}

export class TaskQueue215 {
  protected tasks: Function[] = []

  add(fn: Function): void {
    this.tasks.push(fn)
  }

  run(): number {
    let count = 0
    while (this.tasks.length > 0) {
      this.tasks.shift()!()
      count++
    }
    return count
  }
}

export class LoggedTaskQueue215 extends TaskQueue215 {
  public added: number = 0

  add(fn: Function): void {
    super.add(fn)
    this.added++
  }

  run(): number {
    return super.run()
  }
}

export class Scheduler216 {
  protected timer: number | null = null

  start(fn: Function, interval: number): void {
    this.timer = setInterval(fn, interval)
  }

  stop(): void {
    if (this.timer !== null) {
      clearInterval(this.timer)
    }
    this.timer = null
  }
}

export class CountedScheduler216 extends Scheduler216 {
  public starts: number = 0

  start(fn: Function, interval: number): void {
    super.start(fn, interval)
    this.starts++
  }

  stop(): void {
    super.stop()
  }
}

export class Batcher217 {
  protected buffer: number[] = []

  add(v: number): void {
    this.buffer.push(v)
  }

  flush(): number[] {
    let out = this.buffer
    this.buffer = []
    return out
  }
}

export class SizedBatcher217 extends Batcher217 {
  constructor(public size: number) {
    super()
  }

  add(v: number): void {
    super.add(v)
  }

  isFull(): boolean {
    return this.buffer.length >= this.size
  }

  flushIfFull(): number[] {
    if (this.isFull()) {
      return super.flush()
    }
    return []
  }
}

export class Pipe218 {
  protected stages: ((x: number) => number)[] = []

  add(fn: (x: number) => number): this {
    this.stages.push(fn);
    return this
  }

  run(input: number): number {
    let result = input
    for (let stage of this.stages) {
      result = stage(result)
    }
    return result
  }
}

export class InspectablePipe218 extends Pipe218 {
  add(fn: (x: number) => number): this {
    return super.add(fn)
  }

  stageCount(): number {
    return this.stages.length
  }
}

export class Stream219 {
  protected filterFn: (x: number) => boolean = () => true

  filter(fn: (x: number) => boolean): this {
    this.filterFn = fn;
    return this
  }

  collect(source: number[]): number[] {
    return source.filter(this.filterFn)
  }
}

export class CountingStream219 extends Stream219 {
  filter(fn: (x: number) => boolean): this {
    return super.filter(fn)
  }

  collect(source: number[]): number[] {
    return super.collect(source)
  }
}

export class Mapper220 {
  protected fn: (x: number) => number = (x) => x

  map(fn: (x: number) => number): this {
    this.fn = fn;
    return this
  }

  apply(source: number[]): number[] {
    return source.map(this.fn)
  }
}

export class TrackedMapper220 extends Mapper220 {
  map(fn: (x: number) => number): this {
    return super.map(fn)
  }

  apply(source: number[]): number[] {
    return super.apply(source)
  }
}

export class Api222 {
  version(): number {
    return 2
  }
}

export class FallbackApi222 extends Api222 {
  constructor(public supported: number) {
    super()
  }

  version(): number {
    let v = super.version()
    return v <= this.supported ? v : this.supported
  }
}

export class I18n223 {
  protected messages: Record<string, string> = { hello: 'Hello' }

  t(key: string): string {
    return this.messages[key] ?? key
  }
}

export class ZhI18n223 extends I18n223 {
  protected messages: Record<string, string> = { hello: '你好' }

  t(key: string): string {
    return super.t(key)
  }
}

export class Validator224 {
  validate(value: string): string[] {
    let errors: string[] = []
    if (value.length === 0) {
      errors.push('required')
    }
    return errors
  }
}

export class EmailValidator224 extends Validator224 {
  validate(value: string): string[] {
    let errors = super.validate(value)
    if (value.length > 0 && !value.includes('@')) {
      errors.push('invalid email')
    }
    return errors
  }
}

export class Mapper225 {
  map(input: Record<string, Object>): Record<string, Object> {
    return { id: input['id'], name: input['name'] }
  }
}

export class ExtendedMapper225 extends Mapper225 {
  map(input: Record<string, Object>): Record<string, Object> {
    let base = super.map(input)
    return { ...base, extra: input['extra'] ?? 'none' }
  }
}

export class Transformer226 {
  transform(input: number): string {
    return 'num:' + input
  }
}

export class JsonTransformer226 extends Transformer226 {
  transform(input: number): string {
    let base = super.transform(input)
    return JSON.stringify({ value: base })
  }
}

export class Reducer227 {
  reduce(arr: number[]): number {
    let total = 0
    for (let v of arr) {
      total += v
    }
    return total
  }
}

export class ProductReducer227 extends Reducer227 {
  reduce(arr: number[]): number {
    if (arr.length === 0) {
      return 0
    }
    let product = 1
    for (let v of arr) {
      product *= v
    }
    return product
  }

  sumAndProduct(arr: number[]): number {
    return super.reduce(arr) + this.reduce(arr)
  }
}

export let data = [{ age: 30 }, { age: 20 }, { age: 25 }]

export let original = { a: 1, b: { nested: true } }