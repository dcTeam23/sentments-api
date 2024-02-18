#!/bin/bash

if [ ! $MODEL_URL ]; then
  MODEL_URL='https://github.com/dcTeam23/sentments-api/releases/download/model/best_model_state.bin'
fi

if [ ! -d "assets" ]; then
  mkdir assets
fi

if [ ! -f "assets/best_model_state.bin" ]; then
  wget -P assets $MODEL_URL
  echo "model downloaded"
fi

#Going to the src/api.py and referencing to the app
uvicorn src.api:app --host 0.0.0.0
