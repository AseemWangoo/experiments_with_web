async function classifyImage() {
    const img = document.getElementById('img');

    // LOAD MOBILENET MODEL
    const model = await mobilenet.load();

    // CLASSIFY THE IMAGE
    let predictions = await model.classify(img);
    console.log('Pred >>>', predictions);
    console.log('Length >>>', predictions.length);
}

classifyImage();