rule win_tinba_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.tinba."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tinba"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 8b4510 aa 8b450c ab }
            // n = 4, score = 1100
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   aa                   | stosb               byte ptr es:[edi], al
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   ab                   | stosd               dword ptr es:[edi], eax

        $sequence_1 = { 8b7508 ad 50 56 }
            // n = 4, score = 1100
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   ad                   | lodsd               eax, dword ptr [esi]
            //   50                   | push                eax
            //   56                   | push                esi

        $sequence_2 = { 6a00 ff750c 6a00 6a00 ff7508 }
            // n = 5, score = 1000
            //   6a00                 | push                0
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_3 = { 8a241f 88240f 88041f 41 }
            // n = 4, score = 1000
            //   8a241f               | mov                 ah, byte ptr [edi + ebx]
            //   88240f               | mov                 byte ptr [edi + ecx], ah
            //   88041f               | mov                 byte ptr [edi + ebx], al
            //   41                   | inc                 ecx

        $sequence_4 = { 8b7004 8d7e04 8b0e 3b4d10 }
            // n = 4, score = 900
            //   8b7004               | mov                 esi, dword ptr [eax + 4]
            //   8d7e04               | lea                 edi, [esi + 4]
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   3b4d10               | cmp                 ecx, dword ptr [ebp + 0x10]

        $sequence_5 = { 57 ff750c 51 50 }
            // n = 4, score = 900
            //   57                   | push                edi
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   51                   | push                ecx
            //   50                   | push                eax

        $sequence_6 = { 83ef0a 85c0 7416 66b80d0a 66ab b8436f6f6b }
            // n = 6, score = 900
            //   83ef0a               | sub                 edi, 0xa
            //   85c0                 | test                eax, eax
            //   7416                 | je                  0x18
            //   66b80d0a             | mov                 ax, 0xa0d
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   b8436f6f6b           | mov                 eax, 0x6b6f6f43

        $sequence_7 = { 88c1 ac 88420d f642012b 7407 814a3500200000 }
            // n = 6, score = 900
            //   88c1                 | mov                 cl, al
            //   ac                   | lodsb               al, byte ptr [esi]
            //   88420d               | mov                 byte ptr [edx + 0xd], al
            //   f642012b             | test                byte ptr [edx + 1], 0x2b
            //   7407                 | je                  9
            //   814a3500200000       | or                  dword ptr [edx + 0x35], 0x2000

        $sequence_8 = { f6c301 743c 80f903 7437 b912000000 48 8d3db0010000 }
            // n = 7, score = 900
            //   f6c301               | test                bl, 1
            //   743c                 | je                  0x3e
            //   80f903               | cmp                 cl, 3
            //   7437                 | je                  0x39
            //   b912000000           | mov                 ecx, 0x12
            //   48                   | dec                 eax
            //   8d3db0010000         | lea                 edi, [0x1b0]

        $sequence_9 = { 741b 66b80d0a 66ab b855736572 }
            // n = 4, score = 900
            //   741b                 | je                  0x1d
            //   66b80d0a             | mov                 ax, 0xa0d
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   b855736572           | mov                 eax, 0x72657355

        $sequence_10 = { 0437 aa c14d0804 3b7d0c }
            // n = 4, score = 900
            //   0437                 | add                 al, 0x37
            //   aa                   | stosb               byte ptr es:[edi], al
            //   c14d0804             | ror                 dword ptr [ebp + 8], 4
            //   3b7d0c               | cmp                 edi, dword ptr [ebp + 0xc]

        $sequence_11 = { 48 c7c240000000 4c 8b45b0 4c 8d4db0 }
            // n = 6, score = 900
            //   48                   | dec                 eax
            //   c7c240000000         | mov                 edx, 0x40
            //   4c                   | dec                 esp
            //   8b45b0               | mov                 eax, dword ptr [ebp - 0x50]
            //   4c                   | dec                 esp
            //   8d4db0               | lea                 ecx, [ebp - 0x50]

        $sequence_12 = { 30db e9???????? 80fbfc 751a 814a3500100000 806201df }
            // n = 6, score = 900
            //   30db                 | xor                 bl, bl
            //   e9????????           |                     
            //   80fbfc               | cmp                 bl, 0xfc
            //   751a                 | jne                 0x1c
            //   814a3500100000       | or                  dword ptr [edx + 0x35], 0x1000
            //   806201df             | and                 byte ptr [edx + 1], 0xdf

    condition:
        7 of them and filesize < 57344
}