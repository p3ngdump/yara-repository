rule win_ismdoor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.ismdoor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ismdoor"
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
        $sequence_0 = { 83f8ff 7504 32c0 eb05 c0e804 2401 84c0 }
            // n = 7, score = 400
            //   83f8ff               | cmp                 eax, -1
            //   7504                 | jne                 6
            //   32c0                 | xor                 al, al
            //   eb05                 | jmp                 7
            //   c0e804               | shr                 al, 4
            //   2401                 | and                 al, 1
            //   84c0                 | test                al, al

        $sequence_1 = { 480f43cf 41b820000000 493bd8 4c0f42c3 4d85c0 }
            // n = 5, score = 300
            //   480f43cf             | dec                 eax
            //   41b820000000         | cmovae              ecx, edi
            //   493bd8               | inc                 ecx
            //   4c0f42c3             | mov                 eax, 0x20
            //   4d85c0               | dec                 ecx

        $sequence_2 = { c645d000 33d2 8d4a02 ff15???????? }
            // n = 4, score = 300
            //   c645d000             | mov                 byte ptr [ebp - 0x30], 0
            //   33d2                 | xor                 edx, edx
            //   8d4a02               | lea                 ecx, [edx + 2]
            //   ff15????????         |                     

        $sequence_3 = { e8???????? 4881fe08020000 0f83bd000000 488d942430020000 488bcb }
            // n = 5, score = 300
            //   e8????????           |                     
            //   4881fe08020000       | dec                 eax
            //   0f83bd000000         | cmp                 esi, 0x208
            //   488d942430020000     | jae                 0xc3
            //   488bcb               | dec                 eax

        $sequence_4 = { 7208 488b0e e8???????? 48c7461807000000 33c0 }
            // n = 5, score = 300
            //   7208                 | cmp                 esi, dword ptr [edi + 0x40]
            //   488b0e               | dec                 esp
            //   e8????????           |                     
            //   48c7461807000000     | mov                 dword ptr [esp + 0x30], ecx
            //   33c0                 | dec                 esp

        $sequence_5 = { 418bd7 e8???????? 41ffc6 443b7740 }
            // n = 4, score = 300
            //   418bd7               | cmp                 ebx, eax
            //   e8????????           |                     
            //   41ffc6               | dec                 esp
            //   443b7740             | cmovb               eax, ebx

        $sequence_6 = { 660f7f45b0 488d55b0 488d4c2470 e8???????? }
            // n = 4, score = 300
            //   660f7f45b0           | inc                 ecx
            //   488d55b0             | inc                 esi
            //   488d4c2470           | inc                 esp
            //   e8????????           |                     

        $sequence_7 = { 4c894c2430 4c897de0 4c897de8 4c897df0 }
            // n = 4, score = 300
            //   4c894c2430           | dec                 ebp
            //   4c897de0             | test                eax, eax
            //   4c897de8             | inc                 ecx
            //   4c897df0             | mov                 edx, edi

        $sequence_8 = { 0f43c7 83c6fc 8d1c50 8bc6 2bc2 }
            // n = 5, score = 100
            //   0f43c7               | cmovae              eax, edi
            //   83c6fc               | add                 esi, -4
            //   8d1c50               | lea                 ebx, [eax + edx*2]
            //   8bc6                 | mov                 eax, esi
            //   2bc2                 | sub                 eax, edx

        $sequence_9 = { 837d1c08 8d4508 ff7518 0f434508 8d0c33 }
            // n = 5, score = 100
            //   837d1c08             | cmp                 dword ptr [ebp + 0x1c], 8
            //   8d4508               | lea                 eax, [ebp + 8]
            //   ff7518               | push                dword ptr [ebp + 0x18]
            //   0f434508             | cmovae              eax, dword ptr [ebp + 8]
            //   8d0c33               | lea                 ecx, [ebx + esi]

        $sequence_10 = { 8d8d08ffffff e9???????? 8d8d20ffffff e9???????? 8d4d8c }
            // n = 5, score = 100
            //   8d8d08ffffff         | lea                 ecx, [ebp - 0xf8]
            //   e9????????           |                     
            //   8d8d20ffffff         | lea                 ecx, [ebp - 0xe0]
            //   e9????????           |                     
            //   8d4d8c               | lea                 ecx, [ebp - 0x74]

        $sequence_11 = { e9???????? 8d4d9c e9???????? 8d8d6cffffff e9???????? 8b8d4cffffff }
            // n = 6, score = 100
            //   e9????????           |                     
            //   8d4d9c               | lea                 ecx, [ebp - 0x64]
            //   e9????????           |                     
            //   8d8d6cffffff         | lea                 ecx, [ebp - 0x94]
            //   e9????????           |                     
            //   8b8d4cffffff         | mov                 ecx, dword ptr [ebp - 0xb4]

        $sequence_12 = { 8b4dc8 e9???????? 8d4de4 e9???????? 8b542408 }
            // n = 5, score = 100
            //   8b4dc8               | mov                 ecx, dword ptr [ebp - 0x38]
            //   e9????????           |                     
            //   8d4de4               | lea                 ecx, [ebp - 0x1c]
            //   e9????????           |                     
            //   8b542408             | mov                 edx, dword ptr [esp + 8]

        $sequence_13 = { e8???????? 83c430 c645fc03 8d4508 8b4de4 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   83c430               | add                 esp, 0x30
            //   c645fc03             | mov                 byte ptr [ebp - 4], 3
            //   8d4508               | lea                 eax, [ebp + 8]
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]

        $sequence_14 = { 8bec 8b4508 8d4d10 51 ff750c 6a32 }
            // n = 6, score = 100
            //   8bec                 | mov                 ebp, esp
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8d4d10               | lea                 ecx, [ebp + 0x10]
            //   51                   | push                ecx
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   6a32                 | push                0x32

    condition:
        7 of them and filesize < 1933312
}