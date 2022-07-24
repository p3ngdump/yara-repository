rule win_bbsrat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.bbsrat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bbsrat"
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
        $sequence_0 = { e8???????? 83c404 8b45e8 c1e304 03d8 c1e704 03f8 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   c1e304               | shl                 ebx, 4
            //   03d8                 | add                 ebx, eax
            //   c1e704               | shl                 edi, 4
            //   03f8                 | add                 edi, eax

        $sequence_1 = { 7c02 8bfd 8b463c 8b4e28 3bc1 897e38 7c02 }
            // n = 7, score = 100
            //   7c02                 | jl                  4
            //   8bfd                 | mov                 edi, ebp
            //   8b463c               | mov                 eax, dword ptr [esi + 0x3c]
            //   8b4e28               | mov                 ecx, dword ptr [esi + 0x28]
            //   3bc1                 | cmp                 eax, ecx
            //   897e38               | mov                 dword ptr [esi + 0x38], edi
            //   7c02                 | jl                  4

        $sequence_2 = { 83ec40 53 8b1d???????? 55 8b6c244c 56 57 }
            // n = 7, score = 100
            //   83ec40               | sub                 esp, 0x40
            //   53                   | push                ebx
            //   8b1d????????         |                     
            //   55                   | push                ebp
            //   8b6c244c             | mov                 ebp, dword ptr [esp + 0x4c]
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_3 = { 8d8c240c010000 51 8d942490000000 52 }
            // n = 4, score = 100
            //   8d8c240c010000       | lea                 ecx, [esp + 0x10c]
            //   51                   | push                ecx
            //   8d942490000000       | lea                 edx, [esp + 0x90]
            //   52                   | push                edx

        $sequence_4 = { 5e 5b 8be5 5d c20c00 8b11 8b4208 }
            // n = 7, score = 100
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c20c00               | ret                 0xc
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   8b4208               | mov                 eax, dword ptr [edx + 8]

        $sequence_5 = { ff148570530210 83c408 83f802 7405 83f803 7507 c746049a020000 }
            // n = 7, score = 100
            //   ff148570530210       | call                dword ptr [eax*4 + 0x10025370]
            //   83c408               | add                 esp, 8
            //   83f802               | cmp                 eax, 2
            //   7405                 | je                  7
            //   83f803               | cmp                 eax, 3
            //   7507                 | jne                 9
            //   c746049a020000       | mov                 dword ptr [esi + 4], 0x29a

        $sequence_6 = { 833d????????00 742a 6a00 6a00 6a00 6a00 68???????? }
            // n = 7, score = 100
            //   833d????????00       |                     
            //   742a                 | je                  0x2c
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   68????????           |                     

        $sequence_7 = { 55 53 e8???????? 55 53 e8???????? 50 }
            // n = 7, score = 100
            //   55                   | push                ebp
            //   53                   | push                ebx
            //   e8????????           |                     
            //   55                   | push                ebp
            //   53                   | push                ebx
            //   e8????????           |                     
            //   50                   | push                eax

        $sequence_8 = { 53 e8???????? 85c0 7547 8b4610 8b3d???????? 85c0 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7547                 | jne                 0x49
            //   8b4610               | mov                 eax, dword ptr [esi + 0x10]
            //   8b3d????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_9 = { 83ec14 33c0 89442404 89442408 8944240c 8b4314 c7042400000000 }
            // n = 7, score = 100
            //   83ec14               | sub                 esp, 0x14
            //   33c0                 | xor                 eax, eax
            //   89442404             | mov                 dword ptr [esp + 4], eax
            //   89442408             | mov                 dword ptr [esp + 8], eax
            //   8944240c             | mov                 dword ptr [esp + 0xc], eax
            //   8b4314               | mov                 eax, dword ptr [ebx + 0x14]
            //   c7042400000000       | mov                 dword ptr [esp], 0

    condition:
        7 of them and filesize < 434176
}