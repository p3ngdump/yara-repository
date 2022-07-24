rule win_eternal_petya_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.eternal_petya."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.eternal_petya"
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
        $sequence_0 = { 53 8d4644 50 53 }
            // n = 4, score = 400
            //   53                   | push                ebx
            //   8d4644               | lea                 eax, [esi + 0x44]
            //   50                   | push                eax
            //   53                   | push                ebx

        $sequence_1 = { 49 75f9 56 ff15???????? }
            // n = 4, score = 400
            //   49                   | dec                 ecx
            //   75f9                 | jne                 0xfffffffb
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_2 = { 53 6a21 8d460c 50 }
            // n = 4, score = 400
            //   53                   | push                ebx
            //   6a21                 | push                0x21
            //   8d460c               | lea                 eax, [esi + 0xc]
            //   50                   | push                eax

        $sequence_3 = { 53 68f0000000 6a40 ff15???????? }
            // n = 4, score = 400
            //   53                   | push                ebx
            //   68f0000000           | push                0xf0
            //   6a40                 | push                0x40
            //   ff15????????         |                     

        $sequence_4 = { 51 57 68000000f0 6a18 }
            // n = 4, score = 400
            //   51                   | push                ecx
            //   57                   | push                edi
            //   68000000f0           | push                0xf0000000
            //   6a18                 | push                0x18

        $sequence_5 = { 8d442428 53 50 895c242c e8???????? 83c40c 68fc1f0000 }
            // n = 7, score = 300
            //   8d442428             | lea                 eax, [esp + 0x28]
            //   53                   | push                ebx
            //   50                   | push                eax
            //   895c242c             | mov                 dword ptr [esp + 0x2c], ebx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   68fc1f0000           | push                0x1ffc

        $sequence_6 = { 8d442428 50 6a38 8d442440 }
            // n = 4, score = 300
            //   8d442428             | lea                 eax, [esp + 0x28]
            //   50                   | push                eax
            //   6a38                 | push                0x38
            //   8d442440             | lea                 eax, [esp + 0x40]

        $sequence_7 = { 8d442428 50 6a04 8d442428 50 6a0c ff742424 }
            // n = 7, score = 300
            //   8d442428             | lea                 eax, [esp + 0x28]
            //   50                   | push                eax
            //   6a04                 | push                4
            //   8d442428             | lea                 eax, [esp + 0x28]
            //   50                   | push                eax
            //   6a0c                 | push                0xc
            //   ff742424             | push                dword ptr [esp + 0x24]

        $sequence_8 = { 0145f4 42 8955f8 83c708 8b4b54 33d2 8b434c }
            // n = 7, score = 300
            //   0145f4               | add                 dword ptr [ebp - 0xc], eax
            //   42                   | inc                 edx
            //   8955f8               | mov                 dword ptr [ebp - 8], edx
            //   83c708               | add                 edi, 8
            //   8b4b54               | mov                 ecx, dword ptr [ebx + 0x54]
            //   33d2                 | xor                 edx, edx
            //   8b434c               | mov                 eax, dword ptr [ebx + 0x4c]

        $sequence_9 = { 03c8 8bc2 c1e808 c1e108 2500ff0000 03c8 }
            // n = 6, score = 300
            //   03c8                 | add                 ecx, eax
            //   8bc2                 | mov                 eax, edx
            //   c1e808               | shr                 eax, 8
            //   c1e108               | shl                 ecx, 8
            //   2500ff0000           | and                 eax, 0xff00
            //   03c8                 | add                 ecx, eax

        $sequence_10 = { 68???????? 8bf0 ff15???????? 833d????????00 7405 e8???????? }
            // n = 6, score = 300
            //   68????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   833d????????00       |                     
            //   7405                 | je                  7
            //   e8????????           |                     

        $sequence_11 = { 55 8bec 83ec0c 8b4508 8365fc00 53 8b1d???????? }
            // n = 7, score = 300
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec0c               | sub                 esp, 0xc
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8365fc00             | and                 dword ptr [ebp - 4], 0
            //   53                   | push                ebx
            //   8b1d????????         |                     

        $sequence_12 = { 0f8696000000 56 57 8b4df8 }
            // n = 4, score = 300
            //   0f8696000000         | jbe                 0x9c
            //   56                   | push                esi
            //   57                   | push                edi
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]

        $sequence_13 = { 7478 8d4dcc 51 8d95b4f9ffff 52 c745cc73006800 }
            // n = 6, score = 200
            //   7478                 | je                  0x7a
            //   8d4dcc               | lea                 ecx, [ebp - 0x34]
            //   51                   | push                ecx
            //   8d95b4f9ffff         | lea                 edx, [ebp - 0x64c]
            //   52                   | push                edx
            //   c745cc73006800       | mov                 dword ptr [ebp - 0x34], 0x680073

        $sequence_14 = { 55 8bec 83ec10 33c0 53 8945f8 }
            // n = 6, score = 200
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec10               | sub                 esp, 0x10
            //   33c0                 | xor                 eax, eax
            //   53                   | push                ebx
            //   8945f8               | mov                 dword ptr [ebp - 8], eax

        $sequence_15 = { b908000000 2bd0 8d642400 8b3402 3b30 }
            // n = 5, score = 200
            //   b908000000           | mov                 ecx, 8
            //   2bd0                 | sub                 edx, eax
            //   8d642400             | lea                 esp, [esp]
            //   8b3402               | mov                 esi, dword ptr [edx + eax]
            //   3b30                 | cmp                 esi, dword ptr [eax]

    condition:
        7 of them and filesize < 851968
}