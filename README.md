# Nexys board mono audio output and PWM sound generation

### Team members

* Šándor (responsible for xxx)
* Laban (responsible for xxx)
* Litovska (responsible for Github page)
* Nimmerrichter (responsible for VHDL architecture)

### Table of contents

* [Project objectives](#objectives)
* [Hardware description](#hardware)
* [VHDL modules description and simulations](#modules)
* [TOP module description and simulations](#top)
* [Video](#video)
* [References](#references)

<a name="objectives"></a>

## Project objectives

Our project goal is to generate basic signals and audio samples onto board Nexys A7-50T mono audio output. Pulse width modulation (PWM) must be chosen as the method of sound generation. 

Pulse Width Modulation (PWM) is a technique in which the width of a pulse is modulated keeping the time period of the wave constant. We use PWM module to generate a signal whose pulse width is proportional to the amplitude of the sample data. The PWM output signal is then integrated by a low-pass filter to remove
high frequency components, leaving only the low-frequency content. The output of the lowpass filter provides a reasonable reproduction of the original analog signal.
#### Typical PWM signal waveform
![image](https://user-images.githubusercontent.com/99733524/164760498-d45016fb-d970-4660-83a6-8f6323eebb69.png)

A fourth order low pass filter is composed of two cascaded second order low pass filter sections. There is no limit to the order of the filter that can be formed; as the order of the filter increases, so does its size.

<a name="hardware"></a>

## Hardware description

### Programming board Nexys A7-50T
![image](https://user-images.githubusercontent.com/99733524/164759495-b3c04975-c737-4fab-ad26-e2694aba12a8.png)


### General Purpose I/O Devices on the Nexys A7
![image](https://user-images.githubusercontent.com/99397789/160426546-a02c3c24-168a-4474-8146-a248a762c3aa.png)
<a name="modules"></a>

## VHDL modules description and simulations

Write your text here.

<a name="top"></a>

## TOP module description and simulations

Write your text here.

<a name="video"></a>

## Video

Write your text here

<a name="references"></a>

## References

1. Write your text here.
