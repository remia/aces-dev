
// <ACEStransformID>IDT.ARRI.Alexa-v2-raw-EI640-CCT3500.a1.v1</ACEStransformID>
// <ACESuserName>ACES 1.0 Input - ARRIRAW (EI640, 3500K)</ACESuserName>

// ARRI ALEXA IDT for ALEXA linear files
//  with camera EI set to 640
//  and CCT of adopted white set to 3500K
// Written by v2_IDT_maker.py v0.05 on Friday 19 December 2014

const float EI = 640.0;
const float black = 256.0 / 65535.0;
const float exp_factor = 0.18 / (0.01 * (400.0/EI));

void main
(	input varying float rIn,
	input varying float gIn,
	input varying float bIn,
	input varying float aIn,
	output varying float rOut,
	output varying float gOut,
	output varying float bOut,
	output varying float aOut)
{

	// convert to white-balanced, black-subtracted linear values
	float r_lin = (rIn - black) * exp_factor;
	float g_lin = (gIn - black) * exp_factor;
	float b_lin = (bIn - black) * exp_factor;

	// convert to ACES primaries using CCT-dependent matrix
	rOut = r_lin * 0.784065 + g_lin * 0.103060 + b_lin * 0.112875;
	gOut = r_lin * 0.050690 + g_lin * 1.047016 + b_lin * -0.097707;
	bOut = r_lin * 0.035987 + g_lin * -0.315607 + b_lin * 1.279620;
	aOut = 1.0;

}
