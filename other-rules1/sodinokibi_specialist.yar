rule sodinokibi_specialist
{
    strings:
    $content1 = {2a0064005000200038006c0020002a0064005000200038006c0020002a0064005000200038006c00}
    $content2 = {2a0064005000200038006c0020002a0064005000200038006c0020002a0064005000200038006c00200032006c005400280040006c00200032006c0058002800400078002800}
    $content3 = {32006c005400280040006c00200032006c0058002800400078002800}
    $content4 = {5c0042006100730065004e0061006d00650064004f0062006a0065006300740073005c0025005300}
    
    condition:
        3 of them
}