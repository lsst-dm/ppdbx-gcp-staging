#!/bin/bash
gcloud functions logs read trigger_stage_chunk --region=us-central1 --limit=50
