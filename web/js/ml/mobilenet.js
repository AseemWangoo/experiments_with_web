async function classifyImage() {
    const img = document.getElementById('img');

    // LOAD MOBILENET MODEL
    const model = await mobilenet.load();

    // CLASSIFY THE IMAGE
    let predictions = await model.classify(img);
    console.log('Pred >>>', predictions);
    console.log('Length >>>', predictions.length);

    // Get the logits.
    const logits = model.infer(img);
    console.log('Logits');
    logits.print(true);

    // Get the embedding.
    const embedding = model.infer(img, true);
    console.log('Embedding');
    embedding.print(true);
}

classifyImage();