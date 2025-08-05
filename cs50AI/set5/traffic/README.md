# Traffic Project

Write an AI to identify which traffic sign appears in a photograph.


# Background

In the development of self-driving cars, one of the key challenges is computer vision,

allowing cars to develop an understanding of their environment from digital images.

This involves the ability to recognize and distinguish road signs.

The data set was split into 40% validation set and 60% training set.

All of these models were trained with 10 epochs.

Each model was trained with Adam optimizer and sparse categorical crossentropy loss function


# Install Dependencies

Write this command at your terminal

pip3 install -r requirements.txt

opencv-python

scikit-learn

tensorflow


# Usage:

Run this command at terminal

python traffic.py gtsrb


You can experiment with different model architectures such us:

        different numbers of convolutional and pooling layers

        different numbers and sizes of filters for convolutional layers

        different pool sizes for pooling layers

        different numbers and sizes of hidden layers

        dropout



# Observations

After experimenting  with different neural network architectures:

- My best model achieved:  accuracy: 0.9723 and a loss: 0.1085

- I used for this model :

        Three convolutional layers (using a 3x3 kernel). First: 32 filters, Second: 64 and Third: 128 filters,

        Three pooling layers (using a 2x2 pool size)

        And  a dense layer of 256 units with a  dropout of 0.5.

- The following table shows the "Sequential model":



Model: "Sequential"

Layer (type)--------------Output  Shape------------Param


conv2d (Conv2D)-----------(None, 28, 28, 32)---------896

max_pooling2d-------------(None, 14, 14, 32)-----------0

conv2d_1 (Conv2D)---------(None, 12, 12, 64)-------18496

max_pooling2d_1-----------(None, 6, 6, 64)-------------0

conv2d_2 (Conv2D)---------(None, 4, 4, 128)--------73856

max_pooling2d_2-----------(None, 2, 2, 128)------------0

flatten (Flatten)---------(None, 512)------------------0

dense (Dense)-------------(None, 256)-------------131328

dropout (Dropout)---------(None, 256)------------------0

dense_1 (Dense)-----------(None, 43)---------------11051


Total params: 235,627

rainable params: 235,627

Non-trainable params: 0



# Findings

- The convolutional and pooling layers were effective in extracting relevant features from the images.

- The dropout layer helped in reducing overfitting

- Experimenting with different numbers of layers, filter sizes, hidden units and dropout could lead to further optimization


# Conclusion:

The following table shows the results over the 10 epochs on the training dataset:

- The cross-entropy loss decreases and the accuracy increases over epochs.

- So there is a computational efficiency of the training process

- A good final Testing accuracy: 97.23%  closer to the training one: 96.07%

- And a low loss of 0.10.  Therefore, these results show that there is not overfitting



# Output (Results)


Epoch 1/10
500/500 ━━━━━━━━━━━━━━━━━━━━ 13s 21ms/step - accuracy: 0.2625 - loss: 3.9771

Epoch 2/10
500/500 ━━━━━━━━━━━━━━━━━━━━ 20s 21ms/step - accuracy: 0.7430 - loss: 0.9203

Epoch 3/10
500/500 ━━━━━━━━━━━━━━━━━━━━ 10s 20ms/step - accuracy: 0.8673 - loss: 0.4664

Epoch 4/10
500/500 ━━━━━━━━━━━━━━━━━━━━ 10s 20ms/step - accuracy: 0.9275 - loss: 0.2509

Epoch 5/10
500/500 ━━━━━━━━━━━━━━━━━━━━ 10s 21ms/step - accuracy: 0.9410 - loss: 0.2017

Epoch 6/10
500/500 ━━━━━━━━━━━━━━━━━━━━ 20s 20ms/step - accuracy: 0.9424 - loss: 0.2014

Epoch 7/10
500/500 ━━━━━━━━━━━━━━━━━━━━ 20s 20ms/step - accuracy: 0.9567 - loss: 0.1727

Epoch 8/10
500/500 ━━━━━━━━━━━━━━━━━━━━ 10s 20ms/step - accuracy: 0.9562 - loss: 0.1591

Epoch 9/10
500/500 ━━━━━━━━━━━━━━━━━━━━ 10s 20ms/step - accuracy: 0.9650 - loss: 0.1258

Epoch 10/10
500/500 ━━━━━━━━━━━━━━━━━━━━ 10s 21ms/step - accuracy: 0.9607 - loss: 0.1696

333/333 - 2s - 7ms/step - accuracy: 0.9723 - loss: 0.1085


