async function classifyImage() {
    const img = document.getElementById('img');

    mobilenet.load().then(model => {
        // Classify the image.
        model.classify(img).then(predictions => {
            console.log('Pred', predictions);
            console.log('Length', predictions.length);
        });
    });
}

classifyImage();