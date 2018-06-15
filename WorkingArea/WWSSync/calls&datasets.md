# Calls and sample datasets

## hard coded values

- META_SolutionType = "DXC Offering Family"

### Mapping tables

#### Industry
|offering family|industry|
|---|---|
|Analytics|Pan Industry
|Application Services|Pan Industry
|Business Process Services|Pan Industry
|Cloud and Platform Services|Pan Industry
|Security|Pan Industry
|Workplace and Mobility|Pan Industry
|Cross-Offering Solutions|Pan Industry
|Consulting|Pan Industry
|IS&S Insurance|Insurance
|IS&S Healthcare & Life Sciences|Healthcare & Life Sciences
|IS&S Banking|Banking
|IS&S Travel and Transportation|Travel and Transportation
|Enterprise and Cloud Apps|Pan Industry
|Apps Services and Program Excellence|Pan Industry

#### Feature technology groups

|offering family|technology group
|---|---|
|Analytics|Data & Analytics
|Application Services|Applications
|Business Process Services|Business Process & Information
|Cloud and Platform Services|Infrastructure
|Security|Security
|Workplace and Mobility|Physical meets Digital
|Cross-Offering Solutions|Business Process & Information
|Consulting|Business Technical Assessment & Design
|IS&S Insurance|Business Process & Information
|IS&S Healthcare & Life Sciences|Business Process & Information
|IS&S Banking|Business Process & Information
|IS&S Travel and Transportation|Business Process & Information
|Enterprise and Cloud Apps|Applications
|Apps Services and Program Excellence|Applications



#  2 calls required to retrieve all the required information

1. collate the major offering information (name, description and contacts)
1. collate the sub offering information (feature.{name}, {description}

## call 1
retrieve the major offering information
`https://api.whatwesell.dxc.com/2.0/query/?&fq_page_type=Major Offering`

### mapping table
|key fields|digital Explorer mapping
|---|----|
|"id"   |solution.MajorofferingID (new property)
|"offering_major"|solution.{name}|
|"meta_description"|solution.{elevatorPitch}|
|"page_body"|solution.{description}|
|"offering_family"|solution-[:INFLUENCE]->practice.{name}
|"contact_email"|solution-[:ASSIGNED {role:("contact_role")}]-person.{email}   - **we may need to check and validate if person node exists**  if contact_role is empty default to "Solution owner"
|"url"|attachment -[ ] - solution `of type WWS`


### sample dataset

~~~
{
    "found": 89,
    "start": 0,
    "hit": [
        {
            "id": "cl-102603",
            "fields": {
                "rating": "N/A",
                "domain": "whatwesell.dxc.com",
                "meta_keywords": "life sciences, ls regulatory transformation",
                "restriction": [
                    "Internal Use Only"
                ],
                "meta_description": "DXC helps life sciences clients manage regulatory submissions with professional services, from data analysis and documentation preparation all the way through to compilation of final submissions at various stages of development.",
                "page_body": "life sciences, ls regulatory transformation DXC helps life sciences clients manage regulatory submissions with professional services, from data analysis and documentation preparation all the way through to compilation of final submissions at various stages of development. Under development. Life Sciences Solutions",
                "rating_2_count": "0",
                "title": "Life Sciences Solutions",
                "rating_4_count": "0",
                "page_type": [
                    "Major Offering"
                ],
                "offering_major": [
                    "Life Sciences Solutions"
                ],
                "rating_total": "0",
                "offering_family": [
                    "IS&S Healthcare & Life Sciences"
                ],
                "rating_3_count": "0",
                "offering": [
                    "Animal Pharma and Agriculture: Legacy",
                    "FirstDoc: Legacy",
                    "Life Sciences - Regulatory and Content Services: Legacy"
                ],
                "rating_avg": "0.0",
                "item_code": "9pj102603h335xd",
                "item_id": "102603",
                "rating_1_count": "0",
                "is_certified": "0",
                "url": "https://whatwesell.dxc.com/dxc/offerings/life-sciences-solutions/",
                "industry": [
                    "Healthcare & Life Sciences"
                ],
                "contacts": [
                    {
                        "contact_name": "Cheryl Houston-Walmsley",
                        "contact_email": "cheryl.houston-walmsley@dxc.com",
                        "contact_title": "",
                        "contact_role": "",
                        "contact_alt_role": "",
                        "contact_region": "",
                        "contact_corp_id": "choustonwalm",
                        "dorder": 1
                    }
                ],
                "has_versions": "0",
                "rating_5_count": "0",
                "item_update_date": "2018-06-05T20:02:00Z",
                "result_type": [
                    "Web Page"
                ]
            }
        },
~~~


## call 2 
retrieve the sub offering information

`https://api.whatwesell.dxc.com/2.0/query/?&fq_page_type=Sub-Offering` 

### mapping table
|key fields|digital Explorer mapping
|---|----|
|"id"   |feature.offeringID (new property)
|"offering_sub"|feature.{name}|
|"meta_description"|feature.{description}|
|"url"|feature.url (new property)

### sample dataset


~~~
{
    "found": 81,
    "start": 0,
    "hit": [
        {
            "id": "cl-102228",
            "fields": {
                "rating": "N/A",
                "domain": "whatwesell.dxc.com",
                "meta_keywords": "virtual desktop, windows, windows10, linux, byod, bring your own device, ios, android, macintosh,",
                "restriction": [
                    "Internal Use Only"
                ],
                "meta_description": "DXC Virtual Desktop and Applications Services (VDA) provide virtualized Windows / Linux applications and desktops from the security of a datacenter or from the cloud.",
                "page_body": "virtual desktop, windows, windows10, linux, byod, bring your own device, ios, android, macintosh, DXC Virtual Desktop and Applications Services (VDA) provide virtualized Windows / Linux applications and desktops from the security of a datacenter or from the cloud. DXC Virtual Desktop and Applications Services (VDA) provide virtualized Windows/Linux applications and desktops from the security of a datacenter or from the cloud. Virtualized applications and desktops are accessible from a company's secure network or from the public Internet, allowing users flexible and secure work location and device options, including bring your own device (BYOD). The service bundles end-user assessment, solution design, implementation, and ongoing management for a monthly per-user price. VDA can decrease end-user support and management costs, while significantly increasing data security by moving it off endpoint devices into the datacenter. Support for iOS, Android, Macintosh and Windows endpoint devices provides users with device choices beyond the company PC and better datacenter-based application performance. The introduction of Windows 10, BYOD, and cloud services together pressure to reduce costs are driving enterprises to deliver workplace services differently. DXC Virtual Desktop and Applications Services help clients manage workplace complexities while  enabling them to meet business objectives, lower cost, increase the speed of mergers and acquisitions (M&As), and improve data security. Lower cost—DXC helped a manufacturing company implement a digital workplace in which VDA was a major contributor to saving 50% of their previous budget annually.  Increase speed—VDA helped a healthcare corporation split from their parent company ahead of schedule effectively reducing their tax rate from 26% to 23%.  Improve data security—A European Bank became the financial industry's first \"PC-free\" bank in their effort to improve data security and improve secure access to key corporate applications. .  Flexible—DXC provides flexible service configurations, infrastructure, and delivery locations. We can run virtualization solutions in traditional data center at your location or ours, a Private cloud or Microsoft Azure. In addition, we provide  delivery resources from five VDA Centers of Excellence around the world.  Experienced—DXC has been designing, implementing, and operating VDA and the servers they run on for over 18 years. Our experience is both deep (complex environments) and wide (global, multi-site implementations). With over 1 Million supported  users and 110,000 supported virtual applications, we are a Gartner-recognized global leader.  Increased speed to value—Repeatable transformation processes and a service deployment methodology that use empirical data to size the virtualization infrastructure and optimize deployment strategies eliminates the guesswork that can destabilize  the rollout period.  Partnerships—Longstanding, close partnerships with industry leaders—like Microsoft, Citrix, and VMware—enable us to develop, build, configure, and tune server platforms to perform VDA. Our strong partnerships provide an excellent  platform for delivering high-quality VDA.  Comprehensive—DXC is committed to an integrated view of your workplace, with VDA being an important element in a comprehensive workplace strategy. Our strong suite of workplace services provides business value beyond cost reduction by providing  the right tools to the right user at the right time from any location.  Leader, Gartner Magic Quadrant Managed Workplace Services, Europe and North America, 2017  Leader, Everest Group PEAK Matrix™ for Workplace Services, 2017  Leader, ISG Digital Workspace Vendor Benchmark North America 2017  Leader, Forrester Wave, Global IT Infrastructure Outsourcing, 2014  DXC manages over 1 Million VDA users in 49 countries  DXC manages over 100,000 virtualized applications Employees now expect Windows 10 cloud and mobile consumer type experiences in the digital workplace. While users once demanded mobile email, now the expectation is spilling into corporate applications and data. Corporate application rationalization, Windows 10 compatibilities, slow Windows 10 deployments, and mobile updates are not keeping pace with user expectations. Partners and contractors with Windows 10 PCs struggle to access corporate applications and data securely. DXC recommends that clients start with a DXC managed environment assessment Implementation/Transition time: VDA implementation typically takes 3 – 6 months Deal Value/Size/Length: Price is variable based on scale and complexity of business issues DXC provides a VDA pricing model tool to generate indicative pricing We can deliver VDA worldwide, for any industry      CLIENT   REGION   INDUSTRY   CLOSED/WON        AT&T   Americas   Communications, Media & Entertainment   May 2018      BMW   N.C. Europe   Automotive   May 2018      MEWA Textil-Service AG   N.C. Europe   Business Services   Aug 2017      Ingersoll-Rand Technologies   Americas   Other   Aug 2017      Allianz   N.C. Europe   Financial Markets   Jul 2017/Aug 2014      ING Bank N V Singapore Branch   AMEA   Banking   Jul 2017      Bpost SA   S. Europe   Financial Markets   Jun 2017      PricewaterhouseCoopers Public Sector LLP   Americas   Banking   Jun 2017      Abbvie Inc.AmericasPharmaceuticalJun 2017      NZAN.C. EuropeLife SciencesMay 2017      Department for Work and Pensions (DWP)UK&IGov. Administration & FinanceJan 2017      South Australian Government   ANZ   Public Sector   Oct 2016      NSW Government Cluster   ANZ   Public Sector   Jun 2016      Procter & Gamble   Americas   Manufacturing   May 2016      Rolls-Royce PLC   UK&I   Automotive   Apr 2016      EON AG   N.C. Europe   Energy, Mining & Utilities   Feb 2016      United Technologies Corporation   Americas   Manufacturing   Feb 2016      PostNord   N.C. Europe   Travel & Transportation   Jan 2016      Banco de Sabadell   N.C. Europe   Financial Services   Oct 2015      Cathy Pacific Airways   AMEA   Travel & Transportation   Sep 2015      Commerzbank   N.C. Europe   Financial Services   Sep 2015      KSB   N.C. Europe   Manufacturing   Jun 2015      Liberty Mutual Holdings   UK&I   Insurance Services   Jun 2015      Ericsson   N.C. Europe   Communications, Media & Entertainment   Apr 2015      Link Market Service   ANZ   Financial Services   Mar 2015      Vattenfall   N.C. Europe   Utilities   Mar 2015      Fortum Oyj   N.C. Europe   Energy, Mining & Utilities   Jan 2015    Set up an offering overview presentation with the client involving members of the product marketing team and other SMEs  Always begin with an explanation of the assessment process and benefits  Engage Global Sales Support to collect client requirements  Talk about the benefits of security and operating cost improvements  Talk about the important productivity benefit of secure access to what users want, anywhere/anytime  Recommend a workshop to improve the understanding of project scope and requirements  Initiate a broader outsourcing discussion  Enhance the value DXC brings with additional workplace services  Continue the sales process with a Salesforce.com entry and engage a solution architect",
                "rating_2_count": "0",
                "title": "Virtual Desktop and Applications Services",
                "rating_4_count": "0",
                "page_type": [
                    "Sub-Offering"
                ],
                "offering_major": [
                    "Virtual Desktop Services"
                ],
                "rating_total": "0",
                "offering_family": [
                    "Workplace and Mobility"
                ],
                "rating_3_count": "0",
                "offering": [
                    "Virtual Desktop Services"
                ],
                "rating_avg": "0.0",
                "item_code": "t0b102228w6oxb5",
                "item_id": "102228",
                "rating_1_count": "0",
                "is_certified": "1",
                "url": "https://whatwesell.dxc.com/dxc/offerings/virtual-desktop-applications-services/",
                "contacts": [
                    {
                        "contact_name": "George Ferguson",
                        "contact_email": "george.ferguson@dxc.com",
                        "contact_title": "GtM lead",
                        "contact_role": "Asset Owner",
                        "contact_alt_role": "WW Product Marketing Manager",
                        "contact_region": "Americas",
                        "contact_corp_id": "gferguson3",
                        "dorder": 11
                    },
                    {
                        "contact_name": "Gary Taylor",
                        "contact_email": "gary.taylor@dxc.com",
                        "contact_title": "Virtual Desktop and Applications Product Lead (Citrix)",
                        "contact_role": "",
                        "contact_alt_role": "Offering strategy",
                        "contact_region": "WW",
                        "contact_corp_id": "gtaylor39",
                        "dorder": 20
                    },
                    {
                        "contact_name": "Ronald Neher",
                        "contact_email": "rneher@csc.com",
                        "contact_title": "Virtual Desktop and Applications Product Lead (VMware)",
                        "contact_role": "",
                        "contact_alt_role": "",
                        "contact_region": "WW",
                        "contact_corp_id": "rneher",
                        "dorder": 22
                    }
                ],
                "offering_sub": [
                    "Virtual Desktop and Applications Services"
                ],
                "has_versions": "0",
                "rating_5_count": "0",
                "item_update_date": "2018-06-12T05:00:00Z",
                "result_type": [
                    "Web Page"
                ]
            }
        },
~~~



