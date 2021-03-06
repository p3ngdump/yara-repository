rule win_gearshift_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.gearshift."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gearshift"
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
        $sequence_0 = { 41bc14030000 4c8d0534410000 488bcd 418bd4 e8???????? }
            // n = 5, score = 200
            //   41bc14030000         | jmp                 0x32d
            //   4c8d0534410000       | mov                 eax, dword ptr [ebp + 8]
            //   488bcd               | mov                 dword ptr [ebp - 4], eax
            //   418bd4               | mov                 eax, dword ptr [ebp - 4]
            //   e8????????           |                     

        $sequence_1 = { 4883c308 4885c9 75c0 4983c514 ba14000000 498bcd ff96b0000000 }
            // n = 7, score = 200
            //   4883c308             | lea                 edi, [eax + ebx]
            //   4885c9               | test                eax, eax
            //   75c0                 | js                  0x150
            //   4983c514             | dec                 eax
            //   ba14000000           | mov                 ecx, dword ptr [esp + 0x20]
            //   498bcd               | dec                 eax
            //   ff96b0000000         | lea                 edx, [esp + 0x30]

        $sequence_2 = { 33f6 33d2 41b82c010000 89742420 e8???????? 8d4e02 33d2 }
            // n = 7, score = 200
            //   33f6                 | mov                 eax, eax
            //   33d2                 | inc                 ecx
            //   41b82c010000         | mov                 edx, eax
            //   89742420             | inc                 ebp
            //   e8????????           |                     
            //   8d4e02               | mov                 ecx, eax
            //   33d2                 | shr                 eax, 0x1d

        $sequence_3 = { ff15???????? 488d542434 8bc8 ff15???????? 33c0 }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   488d542434           | dec                 esp
            //   8bc8                 | mov                 esp, ebx
            //   ff15????????         |                     
            //   33c0                 | dec                 eax

        $sequence_4 = { 33d2 e8???????? 488be8 4883f8ff 7507 33c0 e9???????? }
            // n = 7, score = 200
            //   33d2                 | inc                 cx
            //   e8????????           |                     
            //   488be8               | mov                 dword ptr [eax + ecx*2 + 0x3b488], eax
            //   4883f8ff             | inc                 edx
            //   7507                 | jmp                 0x18e
            //   33c0                 | mov                 edx, edi
            //   e9????????           |                     

        $sequence_5 = { 7ce0 488b7c2438 488b4b10 e8???????? 488b4b08 488b742430 4885c9 }
            // n = 7, score = 200
            //   7ce0                 | cmp                 edi, 0x100
            //   488b7c2438           | dec                 eax
            //   488b4b10             | arpl                dx, cx
            //   e8????????           |                     
            //   488b4b08             | mov                 al, byte ptr [ecx + ebx + 0x1c]
            //   488b742430           | inc                 edx
            //   4885c9               | mov                 byte ptr [ecx + eax + 0x39cf0], al

        $sequence_6 = { c705????????80000000 b880000000 488b8c24c0000000 4833cc e8???????? 4881c4d8000000 }
            // n = 6, score = 200
            //   c705????????80000000     |     
            //   b880000000           | and                 ebx, 0x1f
            //   488b8c24c0000000     | dec                 eax
            //   4833cc               | imul                ebx, ebx, 0x58
            //   e8????????           |                     
            //   4881c4d8000000       | dec                 ecx

        $sequence_7 = { 8bc3 488b9c24d0000000 4881c4c0000000 5f }
            // n = 4, score = 200
            //   8bc3                 | dec                 eax
            //   488b9c24d0000000     | cmp                 edx, ecx
            //   4881c4c0000000       | jb                  0x4bf
            //   5f                   | je                  0x488

        $sequence_8 = { c3 83f804 771d c705????????08000000 8bc3 488b9c24d0000000 4881c4c0000000 }
            // n = 7, score = 200
            //   c3                   | add                 eax, 1
            //   83f804               | dec                 eax
            //   771d                 | mov                 dword ptr [esp + 0x40], eax
            //   c705????????08000000     |     
            //   8bc3                 | dec                 eax
            //   488b9c24d0000000     | mov                 eax, dword ptr [esp + 0x48]
            //   4881c4c0000000       | dec                 eax

        $sequence_9 = { b806000000 b904000000 0f44c1 8905???????? 8bc3 488b9c24d0000000 4881c4c0000000 }
            // n = 7, score = 200
            //   b806000000           | mov                 eax, dword ptr [ebx + 0x20]
            //   b904000000           | dec                 eax
            //   0f44c1               | mov                 dword ptr [eax + 0x38], esi
            //   8905????????         |                     
            //   8bc3                 | dec                 eax
            //   488b9c24d0000000     | mov                 edx, dword ptr [ebx + 0x18]
            //   4881c4c0000000       | dec                 eax

    condition:
        7 of them and filesize < 540672
}