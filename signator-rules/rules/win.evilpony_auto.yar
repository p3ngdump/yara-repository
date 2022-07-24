rule win_evilpony_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.evilpony."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.evilpony"
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
        $sequence_0 = { 0345bc 0345b4 c14dac02 8d8c08dcbc1b8f 8b55ac 2355a8 }
            // n = 6, score = 200
            //   0345bc               | add                 eax, dword ptr [ebp - 0x44]
            //   0345b4               | add                 eax, dword ptr [ebp - 0x4c]
            //   c14dac02             | ror                 dword ptr [ebp - 0x54], 2
            //   8d8c08dcbc1b8f       | lea                 ecx, [eax + ecx - 0x70e44324]
            //   8b55ac               | mov                 edx, dword ptr [ebp - 0x54]
            //   2355a8               | and                 edx, dword ptr [ebp - 0x58]

        $sequence_1 = { 7413 53 53 ff75fc ff75f0 ffd7 }
            // n = 6, score = 200
            //   7413                 | je                  0x15
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   ffd7                 | call                edi

        $sequence_2 = { 3345d0 3345c4 d1c0 8945d0 8b45a8 3345b4 c1c105 }
            // n = 7, score = 200
            //   3345d0               | xor                 eax, dword ptr [ebp - 0x30]
            //   3345c4               | xor                 eax, dword ptr [ebp - 0x3c]
            //   d1c0                 | rol                 eax, 1
            //   8945d0               | mov                 dword ptr [ebp - 0x30], eax
            //   8b45a8               | mov                 eax, dword ptr [ebp - 0x58]
            //   3345b4               | xor                 eax, dword ptr [ebp - 0x4c]
            //   c1c105               | rol                 ecx, 5

        $sequence_3 = { 6800000080 50 8bf9 ff15???????? 8985f8efffff 83f8ff 7510 }
            // n = 7, score = 200
            //   6800000080           | push                0x80000000
            //   50                   | push                eax
            //   8bf9                 | mov                 edi, ecx
            //   ff15????????         |                     
            //   8985f8efffff         | mov                 dword ptr [ebp - 0x1008], eax
            //   83f8ff               | cmp                 eax, -1
            //   7510                 | jne                 0x12

        $sequence_4 = { 8bc2 ff742430 50 53 8bc6 e8???????? 83c40c }
            // n = 7, score = 200
            //   8bc2                 | mov                 eax, edx
            //   ff742430             | push                dword ptr [esp + 0x30]
            //   50                   | push                eax
            //   53                   | push                ebx
            //   8bc6                 | mov                 eax, esi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_5 = { 8d8550ffffff 50 ff15???????? 50 ffd6 33c0 398550ffffff }
            // n = 7, score = 200
            //   8d8550ffffff         | lea                 eax, [ebp - 0xb0]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   33c0                 | xor                 eax, eax
            //   398550ffffff         | cmp                 dword ptr [ebp - 0xb0], eax

        $sequence_6 = { 8b442414 8b0488 03442424 8b13 57 57 33c9 }
            // n = 7, score = 200
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   8b0488               | mov                 eax, dword ptr [eax + ecx*4]
            //   03442424             | add                 eax, dword ptr [esp + 0x24]
            //   8b13                 | mov                 edx, dword ptr [ebx]
            //   57                   | push                edi
            //   57                   | push                edi
            //   33c9                 | xor                 ecx, ecx

        $sequence_7 = { 53 6a0d e8???????? 59 }
            // n = 4, score = 200
            //   53                   | push                ebx
            //   6a0d                 | push                0xd
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_8 = { ffd7 85c0 750d ff75fc e8???????? 59 33c0 }
            // n = 7, score = 200
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   750d                 | jne                 0xf
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   33c0                 | xor                 eax, eax

        $sequence_9 = { 57 8bf9 ff15???????? 8985ecfeffff 8b85ecfeffff c1c00b f7d0 }
            // n = 7, score = 200
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx
            //   ff15????????         |                     
            //   8985ecfeffff         | mov                 dword ptr [ebp - 0x114], eax
            //   8b85ecfeffff         | mov                 eax, dword ptr [ebp - 0x114]
            //   c1c00b               | rol                 eax, 0xb
            //   f7d0                 | not                 eax

    condition:
        7 of them and filesize < 147456
}