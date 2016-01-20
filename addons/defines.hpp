
class CfgSounds
{
	sounds[] = {};
	class bl_begin
    {
        name = "NS blowout_begin";
        sound[] = {"addons\blowout\sounds\blowout_begin.ogg",3.162278,1.0};
        titles[] = {};
    };
    class bl_hit1
    {
        name = "NS blowout_begin";
        sound[] = {"addons\blowout\sounds\blowout_hit_1.ogg",1.584893,1.0};
        titles[] = {};
    };
    class bl_hit2
    {
        name = "NS blowout_begin";
        sound[] = {"addons\blowout\sounds\blowout_hit_2.ogg",1.584893,1.0};
        titles[] = {};
    };
    class bl_hit3
    {
        name = "NS blowout_begin";
        sound[] = {"addons\blowout\sounds\blowout_hit_3.ogg",1.584893,1.0};
        titles[] = {};
    };
    class bl_wave1
    {
        name = "NS blowout_begin";
        sound[] = {"addons\blowout\sounds\blowout_wave_1.ogg",1.584893,1.0};
        titles[] = {};
    };
    class bl_wave2
    {
        name = "NS blowout_begin";
        sound[] = {"addons\blowout\sounds\blowout_wave_2.ogg",1.584893,1.0};
        titles[] = {};
    };
    class bl_wave3
    {
        name = "NS blowout_begin";
        sound[] = {"addons\blowout\sounds\blowout_wave_3.ogg",1.584893,1.0};
        titles[] = {};
    };
    class bl_psi
    {
        name = "NS blowout_psi";
        sound[] = {"addons\blowout\sounds\blowout_psy_voices.ogg",1.778279,1.0};
        titles[] = {};
    };
    class bl_full
    {
        name = "NS blowout_full";
        sound[] = {"addons\blowout\sounds\blowout_full_wave.ogg",1.778279,1.0};
        titles[] = {};
    };
    class bl_detect
    {
        name = "NS blowout_detect";
        sound[] = {"addons\blowout\sounds\blowout_detect.ogg",1.778279,1.0};
        titles[] = {};
    };
    class apsi_on
    {
        name = "NS apsi_on";
        sound[] = {"addons\blowout\sounds\apsi_start.ogg",1.778279,1.0};
        titles[] = {};
    };
    class apsi_off
    {
        name = "NS apsi_off";
        sound[] = {"addons\blowout\sounds\apsi_off.ogg",1.778279,1.0};
        titles[] = {};
    };
    class ns_fx_misc4
    {
        name = "Misc strange wind";
        sound[] = {"addons\blowout\sounds\fx_misc4.ogg",1.0,1.0};
        titles[] = {};
    };
    class ns_fx_drone1
    {
        name = "Drone 1";
        sound[] = {"addons\blowout\sounds\fx_drone1.ogg",1.0,1.0};
        titles[] = {};
    };
    class ns_fx_drone2
    {
        name = "Drone 2";
        sound[] = {"addons\blowout\sounds\fx_drone2.ogg",1.0,1.0};
        titles[] = {};
    };
};

class RscTextNS
{
    idc = -1;
    type = 0;
    style = 2;
    LineSpacing = 1.0;
    h = 0.04;
    ColorBackground[] = {1,1,1,0.2};
    ColorText[] = {0.1,0.1,0.1,1};
    font = "BitStream";
    SizeEx = 0.025;

};
class RscTitles {  

     class RscAPSI_h1
    {
        idd = -1;
        duration = 4;
        fadein = 0;
        movingEnable = 0;
        enableSimulation = 0;
        enableDisplay = 0;
        class controls
        {
            class APSILog: RscTextNS
            {
                x = 0.5;
                y = 0.99;
                w = 0.5;
                h = 0.03;
                text = "APSI: Stronger activity of floax field has been detected.."; //APSI: dected stronge energy source
                colorBackground[] = {0.5,0.5,0.5,0.4};
                ColorText[] = {1.0,0.2,0.1,1};
            };
        };
    };
    class RscAPSI_h2: RscAPSI_h1
    {
        class controls
        {
            class APSILog: RscTextNS
            {
                x = 0.5;
                y = 0.99;
                w = 0.4;
                h = 0.03;
                text = "APSI: EVR sequence detected..";//APSI:EVR comming
                colorBackground[] = {0.5,0.5,0.5,0.4};
                ColorText[] = {1.0,0.0,0.2,1};
            };
        };
    };
    class RscAPSI_h3: RscAPSI_h1
    {
        class controls
        {
            class APSILog: RscTextNS
            {
                x = 0.5;
                y = 0.99;
                w = 0.4;
                h = 0.03;
                text = "APSI: EM and PSI protection enabled..";//APSI:Anti EVR system actived
                colorBackground[] = {0.5,0.5,0.5,0.4};
                ColorText[] = {0.0,1.0,0.2,1};
            };
        };
    };
    class RscAPSI_h4: RscAPSI_h1
    {
        class controls
        {
            class APSILog: RscTextNS
            {
                x = 0.5;
                y = 0.99;
                w = 0.4;
                h = 0.03;
                text = "APSI: Ready..";//APSI:Anti system ready
                colorBackground[] = {0.5,0.5,0.5,0.4};
                ColorText[] = {0.0,1.0,0.2,1};
            };
        };
    };
    class RscAPSI_h5: RscAPSI_h1
    {
        class controls
        {
            class APSILog: RscTextNS
            {
                x = 0.5;
                y = 0.99;
                w = 0.4;
                h = 0.03;
                text = "APSI: EVR sequence start..";//APSI:EVR BLOWOUT
                colorBackground[] = {0.5,0.5,0.5,0.4};
                ColorText[] = {1.0,0.0,0.2,1};
            };
        };
    };
    class RscAPSI_h6: RscAPSI_h1
    {
        class controls
        {
            class APSILog: RscTextNS
            {
                x = 0.5;
                y = 0.99;
                w = 0.4;
                h = 0.03;
                text = "APSI: End of EVR..";//APSI: Energy source disapper
                colorBackground[] = {0.5,0.5,0.5,0.4};
                ColorText[] = {0.0,1.0,0.2,1};
            };
        };
    };
    class RscAPSI_ha: RscAPSI_h1
    {
        class controls
        {
            class APSILog: RscTextNS
            {
                x = 0.5;
                y = 0.99;
                w = 0.4;
                h = 0.03;
                text = "EXILE Blowout, v2.0, by Fallingsheep.";//EXILE Blowout system modified Fallingsheep
                colorBackground[] = {0.5,0.5,0.5,0.4};
                ColorText[] = {0.0,1.0,0.2,1};
            };
        };
    };

};