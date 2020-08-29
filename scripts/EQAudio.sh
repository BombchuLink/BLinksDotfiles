#!/bin/bash
Episode=$(echo -e "1\n2\n3\n" | dmenu -i -p "choose an episode!")
#run "Sonic" EQ and treble+bass add/subtract + normalize and compresses for each character
find ~/drives/media/Sanic\ x\ on\ a\ Bridge/Audio/EP$Episode/Raw -name "*Sonic*.wav" -exec sox --norm=-3 {} {}EQd.wav compand 0.2,1 -60,-40 -5 -90 0.2 highpass 160 \;
find ~/drives/media/Sanic\ x\ on\ a\ Bridge/Audio/EP$Episode/Raw -name "*Tails*.wav" -exec sox --norm=-3 {} {}EQd.wav compand 0.2,1 -60,-40 -5 -90 0.2 highpass 160 \;
find ~/drives/media/Sanic\ x\ on\ a\ Bridge/Audio/EP$Episode/Raw -name "*Knuckles*.wav" -exec sox --norm=-3 {} {}EQd.wav compand 0.2,1 -60,-40 -5 -90 0.2 highpass 160 \;
find ~/drives/media/Sanic\ x\ on\ a\ Bridge/Audio/EP$Episode/Raw -name "*Chris*.wav" -exec sox --norm=-3 {} {}EQd.wav compand 0.2,1 -60,-40 -5 -90 0.2 highpass 160 \;
find ~/drives/media/Sanic\ x\ on\ a\ Bridge/Audio/EP$Episode/Raw -name "*Chuck*.wav" -exec sox --norm=-3 {} {}EQd.wav compand 0.2,1 -60,-40 -5 -90 0.2 highpass 160 \;
find ~/drives/media/Sanic\ x\ on\ a\ Bridge/Audio/EP$Episode/Raw -name "*Eggman*.wav" -exec sox --norm=-3 {} {}EQd.wav compand 0.2,1 -60,-40 -5 -90 0.2 highpass 160 \;
find ~/drives/media/Sanic\ x\ on\ a\ Bridge/Audio/EP$Episode/Raw -name "*Cream*.wav" -exec sox --norm=-3 {} {}EQd.wav compand 0.2,1 -60,-40 -5 -90 0.2 highpass 160 \;
find ~/drives/media/Sanic\ x\ on\ a\ Bridge/Audio/EP$Episode/Raw -name "*Amy*.wav" -exec sox --norm=-3 {} {}EQd.wav compand 0.2,1 -60,-40 -5 -90 0.2 highpass 160 \;
find ~/drives/media/Sanic\ x\ on\ a\ Bridge/Audio/EP$Episode/Raw -name "*Nelson*.wav" -exec sox --norm=-3 {} {}EQd.wav compand 0.2,1 -60,-40 -5 -90 0.2 highpass 160 \;
find ~/drives/media/Sanic\ x\ on\ a\ Bridge/Audio/EP$Episode/Raw -name "*Linda*.wav" -exec sox --norm=-3 {} {}EQd.wav compand 0.2,1 -60,-40 -5 -90 0.2 highpass 160 \;
find ~/drives/media/Sanic\ x\ on\ a\ Bridge/Audio/EP$Episode/Raw -name "*Fills*.wav" -exec sox --norm=-3 {} {}EQd.wav compand 0.2,1 -60,-40 -5 -90 0.2 highpass 160 \;
find ~/drives/media/Sanic\ x\ on\ a\ Bridge/Audio/EP$Episode/Raw -name "EQd.wav" -exec mv -v {} ~/drives/media/Sanic\ x\ on\ a\ Bridge/Audio/EP$Episode/EQd \;


