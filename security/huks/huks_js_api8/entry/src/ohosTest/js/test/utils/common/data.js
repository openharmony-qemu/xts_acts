export default class Data {
    static data63B = GetData(63)
    static data64B = GetData(64)
    static data65B = GetData(65)
    static Data_63KB = GetData(63 * 1024)
    static Data_64KB = GetData(64 * 1024)
    static Data_65KB = GetData(65 * 1024)
}

export function GetData(size) {
    let data = new Array;
    for (let i = 0; i < size; i++) {
        data.push('A');
    }
    return data.join("")
}