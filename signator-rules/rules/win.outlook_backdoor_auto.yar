rule win_outlook_backdoor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.outlook_backdoor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.outlook_backdoor"
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
        $sequence_0 = { 741b 48 7408 0a4d0b }
            // n = 4, score = 600
            //   741b                 | je                  0x1d
            //   48                   | dec                 eax
            //   7408                 | je                  0xa
            //   0a4d0b               | or                  cl, byte ptr [ebp + 0xb]

        $sequence_1 = { 83670400 59 5f c3 56 8bf1 e8???????? }
            // n = 7, score = 600
            //   83670400             | and                 dword ptr [edi + 4], 0
            //   59                   | pop                 ecx
            //   5f                   | pop                 edi
            //   c3                   | ret                 
            //   56                   | push                esi
            //   8bf1                 | mov                 esi, ecx
            //   e8????????           |                     

        $sequence_2 = { e8???????? 8b4c2410 8d442450 50 8d442458 50 }
            // n = 6, score = 600
            //   e8????????           |                     
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]
            //   8d442450             | lea                 eax, [esp + 0x50]
            //   50                   | push                eax
            //   8d442458             | lea                 eax, [esp + 0x58]
            //   50                   | push                eax

        $sequence_3 = { 39742418 8d441801 89442410 7e70 0fb640ff 8b17 50 }
            // n = 7, score = 600
            //   39742418             | cmp                 dword ptr [esp + 0x18], esi
            //   8d441801             | lea                 eax, [eax + ebx + 1]
            //   89442410             | mov                 dword ptr [esp + 0x10], eax
            //   7e70                 | jle                 0x72
            //   0fb640ff             | movzx               eax, byte ptr [eax - 1]
            //   8b17                 | mov                 edx, dword ptr [edi]
            //   50                   | push                eax

        $sequence_4 = { 8b4e04 8b4608 2bc1 6a1c 99 5f f7ff }
            // n = 7, score = 600
            //   8b4e04               | mov                 ecx, dword ptr [esi + 4]
            //   8b4608               | mov                 eax, dword ptr [esi + 8]
            //   2bc1                 | sub                 eax, ecx
            //   6a1c                 | push                0x1c
            //   99                   | cdq                 
            //   5f                   | pop                 edi
            //   f7ff                 | idiv                edi

        $sequence_5 = { f6455404 740e 836554fb 57 56 8d4dbc e8???????? }
            // n = 7, score = 600
            //   f6455404             | test                byte ptr [ebp + 0x54], 4
            //   740e                 | je                  0x10
            //   836554fb             | and                 dword ptr [ebp + 0x54], 0xfffffffb
            //   57                   | push                edi
            //   56                   | push                esi
            //   8d4dbc               | lea                 ecx, [ebp - 0x44]
            //   e8????????           |                     

        $sequence_6 = { eba5 8b4df4 5f 5e 64890d00000000 5b }
            // n = 6, score = 600
            //   eba5                 | jmp                 0xffffffa7
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx
            //   5b                   | pop                 ebx

        $sequence_7 = { ff75f8 8b7d08 ebc6 8933 c6430400 5f }
            // n = 6, score = 600
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   ebc6                 | jmp                 0xffffffc8
            //   8933                 | mov                 dword ptr [ebx], esi
            //   c6430400             | mov                 byte ptr [ebx + 4], 0
            //   5f                   | pop                 edi

        $sequence_8 = { e8???????? 85c0 7525 53 6a01 }
            // n = 5, score = 600
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7525                 | jne                 0x27
            //   53                   | push                ebx
            //   6a01                 | push                1

        $sequence_9 = { 8b4508 8b4004 56 33f6 8975ec 8945f0 3bc6 }
            // n = 7, score = 600
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   56                   | push                esi
            //   33f6                 | xor                 esi, esi
            //   8975ec               | mov                 dword ptr [ebp - 0x14], esi
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   3bc6                 | cmp                 eax, esi

    condition:
        7 of them and filesize < 2912256
}