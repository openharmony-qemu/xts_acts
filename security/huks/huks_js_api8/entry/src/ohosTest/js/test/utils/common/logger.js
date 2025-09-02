let tag = "HUKS_XTS"

export class logger {
    static info(...args) {
        console.info(tag, args);
    }

    static log(...args) {
        console.log(tag, args);
    }

    static error(...args) {
        console.error(tag, args);
    }
}