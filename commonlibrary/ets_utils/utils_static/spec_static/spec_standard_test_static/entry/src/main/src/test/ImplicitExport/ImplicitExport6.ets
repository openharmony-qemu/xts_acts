'use static'
export class Base {
    id: int = 0
}
export interface Serializable {
    serialize(): string
}
export interface Idetifiable {
    getId(): int
}
export class Entity extends Base implements Serializable, Idetifiable {
    serialize(): string {
        return "Entity:" +this.id
    }
    getId():int {
        return this.id
    }
}
