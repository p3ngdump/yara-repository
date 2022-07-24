rule win_pandabanker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.pandabanker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pandabanker"
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
        $sequence_0 = { e8???????? 8b37 8bcd 83c620 }
            // n = 4, score = 8600
            //   e8????????           |                     
            //   8b37                 | mov                 esi, dword ptr [edi]
            //   8bcd                 | mov                 ecx, ebp
            //   83c620               | add                 esi, 0x20

        $sequence_1 = { 8bc7 2bc2 03ee 8b742428 8bd8 }
            // n = 5, score = 8600
            //   8bc7                 | mov                 eax, edi
            //   2bc2                 | sub                 eax, edx
            //   03ee                 | add                 ebp, esi
            //   8b742428             | mov                 esi, dword ptr [esp + 0x28]
            //   8bd8                 | mov                 ebx, eax

        $sequence_2 = { 8bd3 c6450022 8d4d01 e8???????? 66c7443d012200 8bc5 5f }
            // n = 7, score = 8600
            //   8bd3                 | mov                 edx, ebx
            //   c6450022             | mov                 byte ptr [ebp], 0x22
            //   8d4d01               | lea                 ecx, [ebp + 1]
            //   e8????????           |                     
            //   66c7443d012200       | mov                 word ptr [ebp + edi + 1], 0x22
            //   8bc5                 | mov                 eax, ebp
            //   5f                   | pop                 edi

        $sequence_3 = { 41 e8???????? 33c9 0fb7f0 8bd7 }
            // n = 5, score = 8600
            //   41                   | inc                 ecx
            //   e8????????           |                     
            //   33c9                 | xor                 ecx, ecx
            //   0fb7f0               | movzx               esi, ax
            //   8bd7                 | mov                 edx, edi

        $sequence_4 = { 8d7c242c 6a10 8bf2 59 f3a4 }
            // n = 5, score = 8600
            //   8d7c242c             | lea                 edi, [esp + 0x2c]
            //   6a10                 | push                0x10
            //   8bf2                 | mov                 esi, edx
            //   59                   | pop                 ecx
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]

        $sequence_5 = { 55 56 8bf1 8954240c 57 33db 8b463c }
            // n = 7, score = 8600
            //   55                   | push                ebp
            //   56                   | push                esi
            //   8bf1                 | mov                 esi, ecx
            //   8954240c             | mov                 dword ptr [esp + 0xc], edx
            //   57                   | push                edi
            //   33db                 | xor                 ebx, ebx
            //   8b463c               | mov                 eax, dword ptr [esi + 0x3c]

        $sequence_6 = { 33c0 33d2 89442418 3bfd 7359 }
            // n = 5, score = 8600
            //   33c0                 | xor                 eax, eax
            //   33d2                 | xor                 edx, edx
            //   89442418             | mov                 dword ptr [esp + 0x18], eax
            //   3bfd                 | cmp                 edi, ebp
            //   7359                 | jae                 0x5b

        $sequence_7 = { ff742418 8bc8 8bfd f3a4 8b742418 8d3c28 }
            // n = 6, score = 8600
            //   ff742418             | push                dword ptr [esp + 0x18]
            //   8bc8                 | mov                 ecx, eax
            //   8bfd                 | mov                 edi, ebp
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   8b742418             | mov                 esi, dword ptr [esp + 0x18]
            //   8d3c28               | lea                 edi, [eax + ebp]

        $sequence_8 = { 57 33ff 896c2414 8b7508 8bdf 85f6 742a }
            // n = 7, score = 8600
            //   57                   | push                edi
            //   33ff                 | xor                 edi, edi
            //   896c2414             | mov                 dword ptr [esp + 0x14], ebp
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8bdf                 | mov                 ebx, edi
            //   85f6                 | test                esi, esi
            //   742a                 | je                  0x2c

        $sequence_9 = { e9???????? 32c0 8bd3 c1e202 8bfe 8bca 45 }
            // n = 7, score = 8600
            //   e9????????           |                     
            //   32c0                 | xor                 al, al
            //   8bd3                 | mov                 edx, ebx
            //   c1e202               | shl                 edx, 2
            //   8bfe                 | mov                 edi, esi
            //   8bca                 | mov                 ecx, edx
            //   45                   | inc                 ebp

    condition:
        7 of them and filesize < 417792
}