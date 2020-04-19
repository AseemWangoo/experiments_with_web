async function classifyImage() {
    const img = document.getElementById('img');

    // RESULT TO PASS
    let result = [];

    // LOAD MOBILENET MODEL
    const model = await mobilenet.load();

    // CLASSIFY THE IMAGE
    let predictions = await model.classify(img);
    console.log('Pred >>>', predictions);

    // Get the logits.
    const logits = model.infer(img);
    console.log('Logits');
    logits.print(true);

    // Get the embedding.
    const embedding = model.infer(img, true);
    console.log('Embedding');
    embedding.print(true);

    // EXTRACTION OF DATA...
    predictions.forEach(function(item, index) {
        // console.log(item);
        // for (let key in item) {
        //     console.log(key, item[key]);
        // }
        result.push(item);
    });

    console.log('O/P', result);
    return result;
}