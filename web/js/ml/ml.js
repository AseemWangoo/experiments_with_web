async function learnLinear(input) {
    // INIT MODEL
    const model = tf.sequential();
    model.add(tf.layers.dense({ units: 1, inputShape: [1] }));

    // COMPILE MODEL
    model.compile({
        loss: 'meanSquaredError',
        optimizer: 'sgd'
    });

    // INPUT -> [6, 1] 6rows 1 columns
    const xs = tf.tensor2d([-1, 0, 1, 2, 3, 4], [6, 1]);
    const ys = tf.tensor2d([-3, -1, 1, 3, 5, 7], [6, 1]);

    // TRAIN MODEL -> EPOCHS (ITERATIONS)
    await model.fit(xs, ys, { epochs: 250 });

    // PREDICT THE VALUE NOW...
    var predictions = model.predict(tf.tensor2d([input], [1, 1]));

    let result = predictions.dataSync();
    console.log('Res', result[0]); //number

    // alert(result[0]);
    return result[0];
    // document.getElementById('ml_output').innerText = result;
}

// learnLinear();