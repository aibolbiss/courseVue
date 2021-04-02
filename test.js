function checkForSpam(message) {
    let result;
    // Пиши код ниже этой строки
    result = message.toLowerCase();
    result = result.includes('spam') || result.includes('sale');
    // Пиши код выше этой строки
    return result;
}
console.log(checkForSpam('Amazing SalE, only tonight!'))``