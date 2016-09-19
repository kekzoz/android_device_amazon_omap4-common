#define PCM_CARD                0
#define PCM_CARD_HDMI           1

#define PCM_CARD_DEFAULT        PCM_CARD

#define MIXER_CARD              0

/* MultiMedia1 LP */
#define PCM_DEVICE_MM_LP        0
#define PCM_DEVICE_MM           1
#define PCM_DEVICE_MM2          2
#define PCM_DEVICE_MM_UL        3
#define PCM_DEVICE_SCO_OUT      4
#define PCM_DEVICE_SCO_IN       5

#define PCM_DEVICE_DEFAULT_OUT  PCM_DEVICE_MM_LP
#define PCM_DEVICE_DEFAULT_IN   PCM_DEVICE_MM_UL

#define OUT_PERIOD_SIZE 960
#define OUT_SHORT_PERIOD_COUNT 4
#define OUT_LONG_PERIOD_COUNT 8
#define OUT_SAMPLING_RATE 48000

#define IN_PERIOD_SIZE 960
#define IN_PERIOD_SIZE_LOW_LATENCY 480
#define IN_PERIOD_COUNT 4
#define IN_SAMPLING_RATE 48000

#define SCO_PERIOD_SIZE 256
#define SCO_PERIOD_COUNT 4
#define SCO_SAMPLING_RATE 8000

#define HDMI_PERIOD_SIZE 960
#define HDMI_SHORT_PERIOD_COUNT 4
#define HDMI_LONG_PERIOD_COUNT 8
#define HDMI_SAMPLING_RATE 48000

struct pcm_config pcm_config_out = {
    .channels = 2,
    .rate = OUT_SAMPLING_RATE,
    .period_size = OUT_PERIOD_SIZE,
    .period_count = OUT_SHORT_PERIOD_COUNT,
    .format = PCM_FORMAT_S16_LE,
    .start_threshold = OUT_PERIOD_SIZE * OUT_SHORT_PERIOD_COUNT,
};

struct pcm_config pcm_config_out_lp = {
    .channels = 2,
    .rate = OUT_SAMPLING_RATE,
    .period_size = OUT_PERIOD_SIZE,
    .period_count = OUT_LONG_PERIOD_COUNT,
    .start_threshold = OUT_PERIOD_SIZE * OUT_SHORT_PERIOD_COUNT,
};

struct pcm_config pcm_config_in = {
    .channels = 1,
    .rate = IN_SAMPLING_RATE,
    .period_size = IN_PERIOD_SIZE,
    .period_count = IN_PERIOD_COUNT,
    .start_threshold = 1,
    .stop_threshold = IN_PERIOD_SIZE * IN_PERIOD_COUNT,
    .format = PCM_FORMAT_S16_LE,
};

struct pcm_config pcm_config_in_low_latency = {
    .channels = 2,
    .rate = IN_SAMPLING_RATE,
    .period_size = IN_PERIOD_SIZE_LOW_LATENCY,
    .period_count = IN_PERIOD_COUNT,
    .start_threshold = 1,
    .stop_threshold = IN_PERIOD_SIZE_LOW_LATENCY * IN_PERIOD_COUNT,
    .format = PCM_FORMAT_S16_LE,
};

struct pcm_config pcm_config_sco = {
    .channels = 1,
    .rate = SCO_SAMPLING_RATE,
    .period_size = SCO_PERIOD_SIZE,
    .period_count = SCO_PERIOD_COUNT,
    .format = PCM_FORMAT_S16_LE,
};

struct pcm_config pcm_config_hdmi = {
    .channels = 2,
    .rate = HDMI_SAMPLING_RATE,
    .period_size = HDMI_PERIOD_SIZE,
    .period_count = HDMI_LONG_PERIOD_COUNT,
    .format = PCM_FORMAT_S16_LE,
    .start_threshold = HDMI_PERIOD_SIZE * HDMI_SHORT_PERIOD_COUNT,
};

