using UnityEngine;

namespace IllusionLoop
{
    [HelpURL("http://www.illusionloop.com/docs")]
    [SelectionBase]
    public class CanalGateController : MonoBehaviour
    {
       [Tooltip("The gate object, that moves up and down")]
        public Transform gate;
       [Tooltip("The screw(handle) object, that rotates to move the gate")]
        public Transform screw;
       [Tooltip("Audio source to play the gate sound")]
        public AudioSource audioGate;
       [Tooltip("Audio source to play the wheel sound")]
        public AudioSource audioWheel;
       [Tooltip("Audio source plays when gate reached the top")]
        public AudioSource audioHit;
       [Tooltip("Speed of the gate in m/s")]
       [Range(0.001f, 10)]
        public float animationSpeed = 0.1f;
       [Tooltip("Rotation speed of the screw. Scales with animationSpeed")]
       [Range(0.001f, 60)]
        public float screwSpeed = 25f;
        [Tooltip("Local y position of the gate object, when it is closed")]
        public float closedPosition = 1;
       [Tooltip("Local y position of the gate object, when it is open")]
        public float openPosition = 2;
        [Tooltip("Automatically deactivates this script, if nothing moves")]
        public bool allowSleep = true;

        float targetPosition = 0;

        public float TargetPosition
        {
            get
            {
                return targetPosition;
            }
            set
            {
                targetPosition = Mathf.Clamp01(value);
                if (allowSleep)
                {
                    enabled = true;//enable to show animation
                }
            }
        }

        float defaultVolumeGate = 0.3f;
        float defaultVolumeWheel = 0.3f;
        float currentVolume = 0;
        /// <summary>
        /// Used to set default values and find the correct gate and screw objects automatically
        /// </summary>
        void Reset()
        {
            //find gate and screw in children
            Transform[] children = transform.GetComponentsInChildren<Transform>();
            for(int ct = 0; ct < children.Length; ct++)
            {
                if (children[ct] != transform)
                {
                    if (gate == null && children[ct].name.Contains("Gate"))
                    {
                        gate = children[ct];
                    }
                    else if (screw == null && children[ct].name.Contains("Screw"))
                    {
                        screw = children[ct];
                    }

                    if (gate != null && screw != null)
                    {
                        break;
                    }
                }
            }

            //find audio sources
            AudioSource[] audioSources = transform.GetComponentsInChildren<AudioSource>();
            for (int ct = 0; ct < audioSources.Length; ct++)
            {
                if (audioGate == null && audioSources[ct].name.Contains("Gate"))
                {
                    audioGate = audioSources[ct];
                    defaultVolumeGate = audioGate.volume;
                }
                if (audioWheel == null && audioSources[ct].name.Contains("Wheel"))
                {
                    audioWheel = audioSources[ct];
                    defaultVolumeWheel = audioWheel.volume;
                }
                if (audioHit == null && audioSources[ct].name.Contains("Hit"))
                {
                    audioHit = audioSources[ct];
                }

                if (audioGate != null && audioWheel != null && audioHit != null)
                {
                    break;
                }
            }

            //reset parameters
            openPosition = 2;
            closedPosition = 1;

            //if gate is out of bounds, adjust bounds
            if (gate != null)
            {
                float yPos = gate.localPosition.y;
                targetPosition = GetRelativeGatePosition(); //calculate current position of the gate, so it doesn't move on startup
                // if position is out of bounds, correct bounds
                if(targetPosition > 1)
                {
                    openPosition = yPos;
                    closedPosition = yPos - 1;
                    targetPosition = 1;
                }
                else if (targetPosition < 0)
                {
                    openPosition = yPos + 1;
                    closedPosition = yPos;
                    targetPosition = 0;
                }
            }
        }
        private void Start()
        {
            targetPosition = GetRelativeGatePosition();
        }

        public void Open()
        {
            TargetPosition = 1;
        }
        public void Close()
        {
            TargetPosition = 0;
        }
        public void Stop()
        {
            TargetPosition = GetRelativeGatePosition();
        }
        /// <summary>
        /// Jumps to the desired position immediately
        /// </summary>
        /// <param name="relativePosition">position between 0 - closed and 1 - open</param>
        public void Snap(float relativePosition)
        {
            targetPosition = Mathf.Clamp01(relativePosition);
            SetRelativeGatePosition(targetPosition);
        }

        // Update is called once per frame
        void Update()
        {
            if(gate != null)
            {
                bool isMoving = false;

                float currentPosition = gate.localPosition.y;
                float relativePosition = GetRelativeGatePosition();
                if(relativePosition < targetPosition)
                {
                    isMoving = true;
                    gate.localPosition += Vector3.up * animationSpeed * Time.deltaTime;
                    if(GetRelativeGatePosition() > targetPosition)//end reached
                    {
                        SetRelativeGatePosition(targetPosition);
                        isMoving = false;
                    }
                    
                }else if(relativePosition > targetPosition)
                {
                    isMoving = true;
                    gate.localPosition -= Vector3.up * animationSpeed * Time.deltaTime;
                    if (GetRelativeGatePosition() < targetPosition)//end reached
                    {
                        SetRelativeGatePosition(targetPosition);
                        isMoving = false;
                    }
                }
                if(screw != null)
                {
                    screw.localRotation = screw.localRotation * Quaternion.Euler(0, (gate.localPosition.y-currentPosition)*screwSpeed*360f, 0);
                }

                if (allowSleep && GetRelativeGatePosition() == targetPosition)
                {
                    enabled = false;
                }
                if (isMoving)
                {
                    currentVolume = Mathf.Lerp(currentVolume, 1,0.1f);
                }
                else
                {
                    if(GetRelativeGatePosition() == 1 && currentVolume > 0)
                    {
                        PlayAudioHit();
                    }
                    currentVolume = 0;

                }
                PlayAudio(currentVolume);
            }

        }

        void PlayAudio(float volume)
        {
            if (audioWheel != null && audioGate != null){
                if (audioWheel.isPlaying == false && volume > 0)
                {
                    audioWheel.Play();
                    audioGate.Play();
                } else if (volume <= 0)
                {
                    audioWheel.Stop();
                    audioGate.Stop();
                }
                if (volume > 0)
                {
                    audioWheel.volume = volume * defaultVolumeWheel;
                    audioGate.volume = volume * defaultVolumeGate;
                }
            }
            

        }
        void PlayAudioHit()
        {
            if (audioHit != null && audioHit.isPlaying == false)
            {
                audioHit.Play();
            }
        }
        /// <summary>
        /// Returns position 0 = closed, 1 = open. Unclamped. Returns targetPosition if gate is null.
        /// </summary>
        /// <returns></returns>
        public float GetRelativeGatePosition()
        {
            if (gate != null)
            {
                float yPos = gate.localPosition.y;
                float gatePos = (yPos - closedPosition) / (openPosition - closedPosition);
                return gatePos;
            }
            return targetPosition;
        }
        /// <summary>
        /// Sets position. 0 = closed, 1 = open. Unclamped.
        /// </summary>
        /// <returns></returns>
        void SetRelativeGatePosition(float relativePosition)
        {
            if (gate != null)
            {
                float gatePos = closedPosition + (openPosition-closedPosition)*relativePosition;

                gate.localPosition = new Vector3(gate.localPosition.x,gatePos, gate.localPosition.z);
            }
        }
    }
}
