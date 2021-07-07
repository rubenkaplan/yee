AAMVAIDBuilder builder = new AAMVAIDBuilder();
builder.SetJurisdiction(AAMVAJurisdiction.NorthCarolina, AAMVAID.LookupIssuerIdentificationNumber(AAMVAJurisdiction.NorthCarolina));

// Set primary data
builder.SetVersion(AAMVAVersion.Version2016);
builder.SetJurisdictionVersion("00");
builder.SetNumberOfEntries(1);

// Build the subfile entry as a driver's license (vs. an ID)
builder.SetSubfileType(0, AAMVASubfileType.DL, "DL");
builder.AddDataElementToSubfile(0, "DAC", "John");
builder.AddDataElementToSubfile(0, "DCS", "Doe");
// etc.

// Get the AAMVA string data
byte[] data;
using (AAMVAID id = builder.Build())
{
   data = id.GetBytes();
}
